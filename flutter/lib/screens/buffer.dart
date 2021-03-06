import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_meal_advisor/functions/math.dart';
import 'package:mobile_meal_advisor/screens/result.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/buffer/gif.dart';
import 'package:mobile_meal_advisor/widgets/buffer/messages.dart';
import 'package:mobile_meal_advisor/widgets/buffer/progress.dart';

class BufferPage extends StatefulWidget {
  const BufferPage({Key? key}) : super(key: key);

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {
  late int _bufferDurationMS;

  @override
  void initState() {
    super.initState();
    setState(() {
      _bufferDurationMS = randint(3, 9) * 1000;
    });
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: _bufferDurationMS), () {
        Navigator.pushReplacement(
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
    return WillPopScope(
      onWillPop: () async => Future.value(false),
      child: Scaffold(
        backgroundColor: Palette.border,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Expanded>[
                Expanded(
                  flex: 2,
                  child: BufferMessages(periodicityMS: 3000),
                ),
                Expanded(
                  flex: 8,
                  child: BufferGIF(),
                ),
                Expanded(
                  flex: 2,
                  child: BufferProgressBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
