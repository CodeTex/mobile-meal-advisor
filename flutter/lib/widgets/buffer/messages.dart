import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/constants/progress_messages.dart';
import 'package:mobile_meal_advisor/functions/math.dart';
import 'package:mobile_meal_advisor/widgets/glass_morphism.dart';

class BufferMessages extends StatefulWidget {
  const BufferMessages({Key? key}) : super(key: key);

  @override
  State<BufferMessages> createState() => _BufferMessagesState();
}

class _BufferMessagesState extends State<BufferMessages> {
  String _message = "";
  late Timer _timer;

  String _updateMessage() {
    int index = randint(0, progressMessages.length - 1);
    return progressMessages[index] + " ...";
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _message = _updateMessage();
    });
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      setState(() {
        _message = _updateMessage();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                _message,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
