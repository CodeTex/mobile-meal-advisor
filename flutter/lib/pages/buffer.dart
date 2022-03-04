import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_meal_advisor/data/progress_messages.dart';
import 'package:mobile_meal_advisor/pages/result.dart';
import 'package:mobile_meal_advisor/theme.dart';

class BufferPage extends StatefulWidget {
  const BufferPage({Key? key}) : super(key: key);

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {
  // Get Gif length on https://gifduration.herokuapp.com/
  final int gifDurationMS = 9000; //7560;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: gifDurationMS), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ResultPage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF825FBE),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const Center(
              child: Image(
                image: AssetImage("assets/gifs/construction.gif"),
              ),
            ),
            Column(
              children: <Widget>[
                const Spacer(flex: 3),
                Expanded(
                    flex: 1, child: BufferLoadingBar(duration: gifDurationMS ~/ 1000)),
              ],
            )
          ],
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
  AnimationController? controller;
  final List<String> messages = progressMessages;
  late String message;
  late double progressStep;

  @override
  void initState() {
    progressStep = (1.0 / widget.duration) * 3;
    message = _randomLoadingStatus(progressStep, "");
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addListener(() {
        if (controller?.value != null) {
          message = _randomLoadingStatus(controller?.value, message);
        }
      });
    controller?.forward();
    // message = _randomLoadingStatus(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
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
              value: controller?.value,
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

  dynamic _randomLoadingStatus(double? progress, String prev) {
    if (progress != null && (progress % progressStep) == 0) {
      int index = Random().nextInt(messages.length);
      return messages[index] + "...";
    }
    return prev;
  }
}
