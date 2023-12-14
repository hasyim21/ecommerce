import 'package:flutter/material.dart';

class MyTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 8.0,
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
    ),
  );
}
