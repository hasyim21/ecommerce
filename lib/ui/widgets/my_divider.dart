import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    this.height,
    this.color,
  });

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.grey.shade100,
      height: height ?? 8.0,
    );
  }
}
