import 'dart:core';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    this.text = "Get Started",
    this.width = double.infinity,
    this.radius = 10.0,
    required this.function,
    this.textSize = 18.0,
    this.height = 54.0,
  });

  final String text;
  final VoidCallback function;
  final double textSize;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: colorScheme.primary,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}