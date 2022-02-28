import 'package:flutter/material.dart';

class SlimBorderedBox extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;

  const SlimBorderedBox({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: borderColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: .4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
