import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final bool isCorrect;
  final Function(bool) onPressed;

  AnswerButton(
      {required this.text, required this.isCorrect, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(isCorrect),
        child: Text(text),
      ),
    );
  }
}
