import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_meal_advisor/constants/progress_messages.dart';
import 'package:mobile_meal_advisor/functions/math.dart';
import 'package:mobile_meal_advisor/screens/result.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/glass_morphism.dart';
import 'package:mobile_meal_advisor/widgets/wave.dart';

class BufferPage extends StatefulWidget {
  const BufferPage({Key? key}) : super(key: key);

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {
  late int _bufferDurationMS;

  final Widget _waveContainer = const WaveContainer(
    duration: Duration(seconds: 3),
    height: 30,
    width: double.infinity,
    waveColor: Color.fromRGBO(109, 166, 223, 1),
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      _bufferDurationMS = randint(3, 9) * 1000;
    });
    // SchedulerBinding.instance?.addPostFrameCallback((_) async {
    //   await Future.delayed(Duration(milliseconds: _bufferDurationMS), () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (_) => const ResultPage(),
    //       ),
    //     );
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Future.value(false),
      child: Scaffold(
        backgroundColor: Palette.border,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Expanded>[
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: GlassContainer(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text("Title")),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  // GIF taken from https://lottiefiles.com
                  // removed stutter by cutting last frame on https://onlinegiftools.com/cut-gif
                  child: Image.asset("assets/gifs/buffer-animation.gif"),
                ),
                Expanded(
                    flex: 2,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _waveContainer,
                            RotationTransition(
                              turns: const AlwaysStoppedAnimation(180 / 360),
                              child: _waveContainer,
                            ),
                          ],
                        ),
                        const GlassContainer(
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(child: Text("Title")),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BufferLoadingBar extends StatefulWidget {
  final int duration;

  const BufferLoadingBar({
    Key? key,
    required this.duration,
  }) : super(key: key);

  @override
  State<BufferLoadingBar> createState() => _BufferLoadingBarState();
}

class _BufferLoadingBarState extends State<BufferLoadingBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  final List<String> messages = progressMessages;
  late String message;
  late double progressStep;

  @override
  void initState() {
    progressStep = (1.0 / widget.duration) * 2;
    // progressStep = 3;
    message = _randomLoadingStatus(progressStep, "");
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addListener(() {
        message = _randomLoadingStatus(controller.value, message);
      });
    controller.forward();
    // message = _randomLoadingStatus(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: const Color(0xFFE3DBB2),
              color: Palette.border,
              value: controller.value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Text(
                message,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic _randomLoadingStatus(double progress, String prev) {
    if ((progress % progressStep) == 0) {
      int index = Random().nextInt(messages.length);
      return messages[index] + "...";
    }
    return prev;
  }
}
