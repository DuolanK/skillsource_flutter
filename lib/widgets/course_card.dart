import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Color.fromARGB(255, 0, 103, 255),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: 70,
              height: 70,
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Image.asset(
                    course['image'],
                    fit: BoxFit.fill,
                    color: Color.fromARGB(255, 0, 103, 255),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    course['description'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: course['progress']),
                    duration: Duration(milliseconds: 500),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor:
                            Color(0xff3049B2), // Темный оттенок фона
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white, // Установите цвет полосы на белый
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
