import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
  final double xPos;
  final double yPos;
  final String imagePath;
  final double height;
  final double width;

  UserMarker(
      {required this.xPos,
      required this.yPos,
      required this.imagePath,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      left: xPos,
      top: yPos,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
      ),
    );
  }
}
