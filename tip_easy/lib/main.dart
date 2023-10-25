import 'package:flutter/material.dart';
import 'package:tip_easy/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      locale: const Locale('pt', 'BR'),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        dividerTheme: const DividerThemeData(
          space: 20.0,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        dividerTheme: const DividerThemeData(
          space: 20.0,
        ),
      ),
    );
  }
}