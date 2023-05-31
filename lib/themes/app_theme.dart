import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFEEF1F8),
  primarySwatch: Colors.blue,
  fontFamily: "Montserrat",
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    errorStyle: TextStyle(height: 0),
    border: defaultInputBorder,
    enabledBorder: defaultInputBorder,
    focusedBorder: defaultInputBorder,
    errorBorder: defaultInputBorder,
  ),
);
const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
