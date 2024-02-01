import 'package:flutter/material.dart';

const Color color = Colors.white;

class HeadingText extends StatelessWidget {
  const HeadingText(this.text, {super.key});

  final String text;

  @override
  build(context) {
    return Text(
        style: const TextStyle(
            fontSize: 24, color: color, fontWeight: FontWeight.w600),
        text);
  }
}
