import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String text;

  QuestionText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
