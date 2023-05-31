// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import 'course_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Проверка квалификации',
      'description': 'Short description for Course 1',
      'image': 'lib/assets/images/airliner.png',
      'progress': 0.5,
    },
    {
      'title': 'Course 2',
      'description': 'Short description for Course 2',
      'image': 'lib/assets/images/welding-mask.png',
      'progress': 0.4,
    },
    {
      'title': 'Course 3',
      'description': 'Short description for Course 3',
      'image': 'lib/assets/images/course_image.png',
      'progress': 0.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 103, 255),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Привет, ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'Username!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications),
                                color: Color.fromARGB(255, 0, 103, 255),
                                iconSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 52.0,
                                lineWidth: 10,
                                percent: 0.25,
                                center: Icon(
                                  Icons.book,
                                  size: 28.0,
                                  color: Colors.white,
                                ),
                                progressColor: Colors.white,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Навыки',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 52.0,
                                lineWidth: 10,
                                percent: 0.35,
                                center: Icon(
                                  Icons.book,
                                  size: 28.0,
                                  color: Colors.white,
                                ),
                                progressColor: Colors.white,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Язык',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 52.0,
                                lineWidth: 10,
                                percent: 0.45,
                                center: Icon(
                                  Icons.book,
                                  size: 28.0,
                                  color: Colors.white,
                                ),
                                progressColor: Colors.white,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Симуляция',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Мои курсы',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Show all',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(),
                          ),
                        );
                      },
                      child: CourseCard(course: course),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
