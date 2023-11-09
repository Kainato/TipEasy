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
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 12, color: Colors.black),
          titleMedium: TextStyle(fontSize: 16, color: Colors.black),
          titleLarge: TextStyle(fontSize: 20, color: Colors.black),
          bodySmall: TextStyle(fontSize: 12, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
          displayLarge: TextStyle(fontSize: 24, color: Colors.black),
          displayMedium: TextStyle(fontSize: 20, color: Colors.black),
          displaySmall: TextStyle(fontSize: 16, color: Colors.black),
          headlineLarge: TextStyle(fontSize: 24, color: Colors.black),
          headlineMedium: TextStyle(fontSize: 20, color: Colors.black),
          headlineSmall: TextStyle(fontSize: 16, color: Colors.black),
          labelLarge: TextStyle(fontSize: 20, color: Colors.black),
          labelMedium: TextStyle(fontSize: 16, color: Colors.black),
          labelSmall: TextStyle(fontSize: 12, color: Colors.black),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          // Primary Color
          primary: Colors.green,
          onPrimary: Colors.white,
          // Secondary Color
          secondary: Colors.purple,
          onSecondary: Colors.white,
          // Error Color
          error: Colors.red,
          onError: Colors.white,
          // Surface Color
          surface: Colors.white,
          onSurface: Colors.black,
          // Background Color
          background: Colors.white,
          onBackground: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 12, color: Colors.white),
          titleMedium: TextStyle(fontSize: 16, color: Colors.white),
          titleLarge: TextStyle(fontSize: 20, color: Colors.white),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
          displayLarge: TextStyle(fontSize: 24, color: Colors.white),
          displayMedium: TextStyle(fontSize: 20, color: Colors.white),
          displaySmall: TextStyle(fontSize: 16, color: Colors.white),
          headlineLarge: TextStyle(fontSize: 24, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 20, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 16, color: Colors.white),
          labelLarge: TextStyle(fontSize: 20, color: Colors.white),
          labelMedium: TextStyle(fontSize: 16, color: Colors.white),
          labelSmall: TextStyle(fontSize: 12, color: Colors.white),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          // Primary Color
          primary: Colors.green.shade200,
          onPrimary: Colors.green.shade700,
          // Secondary Color
          secondary: Colors.purple.shade200,
          onSecondary: Colors.purple.shade700,
          // Error Color
          error: Colors.red.shade200,
          onError: Colors.red.shade700,
          // Surface Color
          surface: Colors.grey.shade800,
          onSurface: Colors.white,
          // Background Color
          background: Colors.grey.shade900,
          onBackground: Colors.white,
        ),
      ),
    );
  }
}
