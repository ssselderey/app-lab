import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 8, 14, 30),
      primary: Colors.white,
  ),
);