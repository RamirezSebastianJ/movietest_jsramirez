import 'package:flutter/material.dart';

class MovieTestColors {
  static const black = Color(0xFF0D0D0D);
  static const purple = Color(0xFF41388d);
  static const mardiGras = Color(0xFF8A1C7C);
  static const cerise = Color(0xFFDA4167);
  static const cameoPink = Color(0xFFF0BCD4);
  static const artichoke = Color(0xFF899D78);
}

final lighTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: MovieTestColors.black),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromRGBO(37, 37, 37, 1),
    focusColor: const Color.fromRGBO(37, 37, 37, 1),
    hoverColor: const Color.fromRGBO(37, 37, 37, 1),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Color.fromRGBO(83, 231, 139, 1),
        style: BorderStyle.solid,
      ),
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),
  ),
);

BorderSide borderTransparent() {
  return const BorderSide(color: Colors.transparent, width: 0);
}
