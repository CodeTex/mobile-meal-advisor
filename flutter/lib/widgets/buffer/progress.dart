import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/theme.dart';
import 'package:mobile_meal_advisor/widgets/wave.dart';

class BufferProgressBar extends StatelessWidget {
  final Widget _waveContainer = const WaveContainer(
    duration: Duration(seconds: 3),
    height: 40,
    width: double.infinity,
    waveColor: Color.fromRGBO(109, 166, 223, 1),
  );

  const BufferProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            alignment: Alignment.center,
            height: 10,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const LinearProgressIndicator(
              backgroundColor: Palette.primary,
              color: Palette.border,
              minHeight: 5,
            ),
          ),
        ),
      ],
    );
  }
}
