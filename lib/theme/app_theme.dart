import 'package:flutter/material.dart';

class AppTheme {
  static List<Color> colors = <Color>[
    Colors.blue.shade800,
    Colors.green.shade800,
    Colors.orange.shade800,
    Colors.teal.shade800,
  ];

  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: colors[0]),
    useMaterial3: true,
  );
}
