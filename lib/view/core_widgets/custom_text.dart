import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color? textColor;

  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: size, fontWeight: weight),
    );
  }
}
