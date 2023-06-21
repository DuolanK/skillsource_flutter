import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quiz_screen.dart';
import 'theory_screen.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Future<List<Map<String, dynamic>>>? _courseDataFuture;
  Future<List<Map<String, dynamic>>> getCourseData() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/courses.json';
    String jsonStringCourses = await File(filePath).readAsString();

    String jsonStringQuizzes =
        await rootBundle.loadString('lib/assets/data/quiz.json');
    String jsonStringTheoryMaterials =
        await rootBundle.loadString('lib/assets/data/theory_materials.json');

    List<Map<String, dynamic>> jsonDataCourses =
        List<Map<String, dynamic>>.from(json.decode(jsonStringCourses));
    List<dynamic> jsonDataQuizzes = json.decode(jsonStringQuizzes);
    List<Map<String, dynamic>> jsonDataTheoryMaterials =
        List<Map<String, dynamic>>.from(json.decode(jsonStringTheoryMaterials));

    List<Map<String, dynamic>> courseData = [];

    for (var courseItem in jsonDataCourses) {
      if (courseItem['type'] == 'text') {
        courseData.add({
          'type': courseItem['type'],
          'title': courseItem['title'],
          'description': courseItem['description'],
          'isAccessible': courseItem['isAccessible'],
          'data': jsonDataTheoryMaterials.firstWhere(
              (element) => element['theoryId'] == courseItem['theoryId'],
              orElse: () => {}),
        });
      } else if (courseItem['type'] == 'quiz') {
        courseData.add({
          'type': courseItem['type'],
          'title': courseItem['title'],
          'description': courseItem['description'],
          'isAccessible': courseItem['isAccessible'],
          'data': jsonDataQuizzes.firstWhere(
              (element) => element['quizId'] == courseItem['quizId'],
              orElse: () => {}),
        });
      }
    }

    return courseData;
  }

  @override
  void initState() {
    super.initState();
    _courseDataFuture = getCourseData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: FutureBuilder<List<dynamic>>(
        future: _courseDataFuture,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final courseData = snapshot.data!;
            return ListView.builder(
              itemCount: courseData.length,
              itemBuilder: (BuildContext context, int index) {
                final courseItem = courseData[index];
                IconData accessIcon = courseItem['isAccessible']
                    ? Icons.check_circle
                    : Icons.cancel;
                String courseDescription = courseItem['description'];

                return ListTile(
                  leading: Icon(accessIcon),
                  title: Text(courseItem['title']),
                  subtitle: Text(courseDescription),
                  onTap: () {
                    if (courseItem['isAccessible'] &&
                        courseItem['data'].isNotEmpty) {
                      print(
                          '${courseItem['type']} data: ${courseItem['data']}');
                      if (courseItem['type'] == 'text') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TheoryScreen(theoryData: courseItem['data']),
                          ),
                        );
                      } else if (courseItem['type'] == 'quiz') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizScreen(quizData: courseItem['data']),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Access denied or data not found'),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
