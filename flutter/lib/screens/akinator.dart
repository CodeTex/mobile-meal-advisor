import 'package:flutter/material.dart';

class MaltAkinator extends StatefulWidget {
  const MaltAkinator({Key? key}) : super(key: key);

  @override
  State<MaltAkinator> createState() => _MaltAkinatorState();
}

class _MaltAkinatorState extends State<MaltAkinator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Center(
          child: Text("Akinator"),
        ),
      ),
    );
  }
}
