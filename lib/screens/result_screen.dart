import 'package:flutter/material.dart';
import 'package:skillsourse/constants.dart';
import 'package:skillsourse/screens/quiz_screen.dart';

class ResultsScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final VoidCallback onResetQuiz;

  ResultsScreen({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.onResetQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: primaryOne,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              correctAnswers == totalQuestions
                  ? Icons.check_circle
                  : Icons.cancel,
              color:
                  correctAnswers == totalQuestions ? Colors.green : Colors.red,
              size: 80,
            ),
            SizedBox(height: 32),
            Text(
              'You scored $correctAnswers out of $totalQuestions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onResetQuiz();
              },
              child: Text('Try Again'),
              style: ElevatedButton.styleFrom(
                primary: primaryOne, // Apply a custom color for the button
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
