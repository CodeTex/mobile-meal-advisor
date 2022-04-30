import 'package:flutter/material.dart';
import 'package:mobile_meal_advisor/widgets/glass_morphism.dart';

class BufferMessages extends StatefulWidget {
  const BufferMessages({Key? key}) : super(key: key);

  @override
  State<BufferMessages> createState() => _BufferMessagesState();
}

class _BufferMessagesState extends State<BufferMessages> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GlassContainer(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(child: Text("Title")),
          ),
        ),
      ),
    );
  }
}
