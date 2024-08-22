import 'package:chomper_run/buttons_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const MainMenu(),
    ),
  );
}