import 'package:flutter/material.dart';
import 'package:tip_easy/home_page.dart';
import 'package:tip_easy/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        return MaterialApp(
          home: const HomePage(),
          locale: const Locale('pt', 'BR'),
          theme: ThemeColors.lightTheme,
          darkTheme: ThemeColors.darkTheme,
          debugShowCheckedModeBanner: false,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
        );
      },
    );
  }
}
