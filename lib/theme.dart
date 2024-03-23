// File: theme.dart

import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.green,
  fontFamily: 'Georgia',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green[200], // Set the app bar color.
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green[200]!),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green[200]!),
    ),
    labelStyle: TextStyle(
      color: Colors.green[700], // Avocado green.
      fontFamily: 'Georgia',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green[200]), // Background color.
      foregroundColor: MaterialStateProperty.all(Colors.black), // Text color.
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Georgia'), // Global bold style for ElevatedButton text.
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  ),
);
const EdgeInsets appMargin = EdgeInsets.all(40.0);