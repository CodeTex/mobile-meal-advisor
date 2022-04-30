import 'package:flutter/material.dart';

class BufferGIF extends StatelessWidget {
  const BufferGIF({Key? key}) : super(key: key);

  // GIF taken from https://lottiefiles.com
  // removed stutter by cutting last frame on https://onlinegiftools.com/cut-gif

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Image.asset("assets/gifs/buffer-animation.gif"),
    );
  }
}
