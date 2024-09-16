import 'package:flutter/material.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget(
      {super.key,
      required this.widget,
      required this.backgroundColor,
      this.height = 60,
      this.width = 60});

  final Widget widget;
  final double height;
  final double width;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height/2),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: widget,
    );
  }
}
