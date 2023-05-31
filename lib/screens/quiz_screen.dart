import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillsource/constants.dart';
import 'package:skillsource/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Map<String, dynamic> quizData;

  QuizScreen({required this.quizData});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  List<String> questionImages = [
    'https://www.safetyandhealthmagazine.com/ext/resources/images/safety-tips/welder.jpg?t=1483464014&width=768',
    'https://cdn.thefabricator.com/a/welding-art-form-scientific-process-or-both-1-1617172779.jpg',
    'https://m.media-amazon.com/images/I/61Cge6svJWL._SL1060_.jpg',
    'https://cdn.shopify.com/s/files/1/0252/1176/4789/files/1f2c7e18ce0426c72084b8ce4103ca7a_480x480.jpg?v=1655316264',
    'https://www.yourcentralvalley.com/wp-content/uploads/sites/54/2023/01/Education-Matters-Getting-more-girls-into-welding.jpg',
    'https://www.manufacturingguide.com/sites/default/files/styles/illustration/public/illustrations/weld_migmag_01.png?itok=7inDmfQ_',
    'https://www.twi-global.com/CachedImage.axd?ImageName=arc-welding-circuit-diagram400x330.jpg&ImageWidth=400&ImageHeight=330&ImageVersionID=89945&ImageModified=20191004103224',
  ];

  @override
  void initState() {
    super.initState();
  }

  void _checkAnswer(bool isCorrect) {
    if (_currentQuestionIndex < widget.quizData['questions'].length - 1) {
      setState(() {
        if (isCorrect) {
          _correctAnswers++;
        }
        _currentQuestionIndex++;
      });
    } else {
      if (isCorrect) _correctAnswers++;
      _goToResultsScreen();
    }
  }

  void _goToResultsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          totalQuestions: widget.quizData['questions'].length,
          correctAnswers: _correctAnswers,
          onResetQuiz: _resetQuiz,
        ),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _correctAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentQuestion =
        widget.quizData['questions'][_currentQuestionIndex];

    String questionImage =
        questionImages[_currentQuestionIndex % questionImages.length];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryOne,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) /
                  widget.quizData['questions'].length,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 2, 255, 15)),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    currentQuestion['question'],
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    questionImage,
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: currentQuestion['answers']
                  .map<Widget>((answer) => Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              onPressed: () => _checkAnswer(answer['correct']),
                              child: Text(answer['text']),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
