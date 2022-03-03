import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_meal_advisor/pages/result.dart';

class BufferPage extends StatefulWidget {
  const BufferPage({Key? key}) : super(key: key);

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {
  // Get Gif length on https://gifduration.herokuapp.com/
  final int gifDuration = 9000; //7560;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: gifDuration), () {
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
    return const Scaffold(
      backgroundColor: Color(0xFF825FBE),
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage("assets/gifs/construction.gif"),
          ),
        ),
      ),
    );
  }
}
