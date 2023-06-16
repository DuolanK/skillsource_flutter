import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final apiUrl = 'http://127.0.0.1:8000';

  final quizDataResponse = await http.get(Uri.parse('$apiUrl/quiz/'));
  final questionDataResponse = await http.get(Uri.parse('$apiUrl/question/'));
  final rightAnswerDataResponse =
      await http.get(Uri.parse('$apiUrl/rightanswer/'));
  final wrongAnswerDataResponse =
      await http.get(Uri.parse('$apiUrl/wronganswer/'));
  final coursesDataResponse = await http.get(Uri.parse('$apiUrl/courses/'));

  if (quizDataResponse.statusCode == 200 &&
      questionDataResponse.statusCode == 200 &&
      rightAnswerDataResponse.statusCode == 200 &&
      wrongAnswerDataResponse.statusCode == 200 &&
      coursesDataResponse.statusCode == 200) {
    final quizData = quizDataResponse.body;
    final questionData = questionDataResponse.body;
    final rightAnswerData = rightAnswerDataResponse.body;
    final wrongAnswerData = wrongAnswerDataResponse.body;
    final coursesData = coursesDataResponse.body;

    await saveDataToFile(quizData, 'quiz.json');
    await saveDataToFile(questionData, 'question.json');
    await saveDataToFile(rightAnswerData, 'rightanswer.json');
    await saveDataToFile(wrongAnswerData, 'wronganswer.json');
    await saveDataToFile(coursesData, 'courses.json');
  } else {
    print('Failed to fetch data. Status code: ${quizDataResponse.statusCode}');
  }
}

Future<void> saveDataToFile(String data, String fileName) async {
  final directory = Directory('packages/skillsource/assets/data');
  final file = File('${directory.path}/$fileName');
  await file.writeAsString(data);
  print('Data saved to ${file.path}');
}
