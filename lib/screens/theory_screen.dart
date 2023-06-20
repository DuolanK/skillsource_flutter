import 'package:flutter/material.dart';

class TheoryScreen extends StatelessWidget {
  final Map<String, dynamic>? theoryData;

  TheoryScreen({required this.theoryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theoryData?['title'] ?? 'No title'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          theoryData?['content'] ?? 'No content',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
