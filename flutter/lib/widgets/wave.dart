import 'dart:math';

import 'package:flutter/material.dart';

class WaveContainer extends StatefulWidget {
  final Duration? duration;
  final double height;
  final double width;
  final Color? waveColor;

  const WaveContainer({
    Key? key,
    this.duration,
    required this.height,
    required this.width,
    this.waveColor,
  }) : super(key: key);

  @override
  State<WaveContainer> createState() => _WaveContainerState();
}

class _WaveContainerState extends State<WaveContainer> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Duration _duration;
  late Color _waveColor;

  @override
  void initState() {
    super.initState();
    _duration = widget.duration ?? const Duration(milliseconds: 1000);
    _animationController = AnimationController(vsync: this, duration: _duration);
    _waveColor = widget.waveColor ?? Colors.lightBlueAccent;
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            painter: WavePainter(
              waveAnimation: _animationController,
              waveColor: _waveColor,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> waveAnimation;
  final Color waveColor;

  WavePainter({
    required this.waveAnimation,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
        i,
        sin((i / size.width * 2 * pi) + (waveAnimation.value * 2 * pi)) * 4,
      );
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    Paint wavePaint = Paint()..color = waveColor;
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
