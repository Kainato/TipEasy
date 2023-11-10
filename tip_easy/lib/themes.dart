import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  widgetTheme(
    BuildContext context, {
    required dynamic lightTheme,
    required dynamic darkTheme,
  }) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTheme
        : lightTheme;
  }
}

class ThemeColors {
  static const Color primary = Colors.green;
  static const Color secondary = Colors.purple;
  static const Color error = Colors.red;
  static const Color onPSR = Colors.white;
  static const Color surface = Colors.white;
  static const Color onSB = Colors.black;
  static const Color background = Colors.white;

  static Color primaryDark = Colors.green.shade200;
  static Color onPrimaryDark = Colors.green.shade700;
  static Color secondaryDark = Colors.purple.shade200;
  static Color onSecondaryDark = Colors.purple.shade700;
  static Color errorDark = Colors.red.shade200;
  static Color onErrorDark = Colors.red.shade700;
  static Color surfaceDark = Colors.grey.shade800;
  static Color onSurfaceDark = Colors.white;
  static Color backgroundDark = Colors.grey.shade900;
  static Color onBackgroundDark = Colors.white;

  static ThemeData lightTheme = ThemeData(
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
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      // Primary Color
      primary: ThemeColors.primary,
      onPrimary: ThemeColors.onPSR,
      // Secondary Color
      secondary: ThemeColors.secondary,
      onSecondary: ThemeColors.onPSR,
      // Error Color
      error: ThemeColors.error,
      onError: ThemeColors.onPSR,
      // Surface Color
      surface: ThemeColors.surface,
      onSurface: ThemeColors.onSB,
      // Background Color
      background: ThemeColors.background,
      onBackground: ThemeColors.onSB,
    ),
  );

  static ThemeData darkTheme = ThemeData(
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
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      // Primary Color
      primary: ThemeColors.primaryDark,
      onPrimary: ThemeColors.onPrimaryDark,
      // Secondary Color
      secondary: ThemeColors.secondaryDark,
      onSecondary: ThemeColors.onSecondaryDark,
      // Error Color
      error: ThemeColors.errorDark,
      onError: ThemeColors.onErrorDark,
      // Surface Color
      surface: ThemeColors.surfaceDark,
      onSurface: ThemeColors.onSurfaceDark,
      // Background Color
      background: ThemeColors.backgroundDark,
      onBackground: ThemeColors.onBackgroundDark,
    ),
  );

  primaryColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? primaryDark : primary;

  onPrimaryColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? onPrimaryDark : onPSR;

  secondaryColor(context) => Theme.of(context).brightness == Brightness.dark
      ? secondaryDark
      : secondary;

  onSecondaryColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? onSecondaryDark : onPSR;

  errorColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? errorDark : error;

  onErrorColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? onErrorDark : onPSR;

  surfaceColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? surfaceDark : surface;

  onSurfaceColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? onSurfaceDark : onSB;

  backgroundColor(context) => Theme.of(context).brightness == Brightness.dark
      ? backgroundDark
      : background;

  onBackgroundColor(context) =>
      Theme.of(context).brightness == Brightness.dark ? onBackgroundDark : onSB;
}

class TextThemeData {
  static const TextStyle titleSmall = TextStyle(fontSize: 12);
  static const TextStyle titleMedium = TextStyle(fontSize: 16);
  static const TextStyle titleLarge = TextStyle(fontSize: 20);
  static const TextStyle bodySmall = TextStyle(fontSize: 12);
  static const TextStyle bodyMedium = TextStyle(fontSize: 16);
  static const TextStyle bodyLarge = TextStyle(fontSize: 20);
  static const TextStyle displayLarge = TextStyle(fontSize: 24);
  static const TextStyle displayMedium = TextStyle(fontSize: 20);
  static const TextStyle displaySmall = TextStyle(fontSize: 16);
  static const TextStyle headlineLarge = TextStyle(fontSize: 24);
  static const TextStyle headlineMedium = TextStyle(fontSize: 20);
  static const TextStyle headlineSmall = TextStyle(fontSize: 16);
  static const TextStyle labelLarge = TextStyle(fontSize: 20);
  static const TextStyle labelMedium = TextStyle(fontSize: 16);
  static const TextStyle labelSmall = TextStyle(fontSize: 12);
}

class PaddingScreen {
  pad10(context) {
    return MediaQuery.of(context).size.width * 0.1;
  }

  pad20(context) {
    return MediaQuery.of(context).size.width * 0.2;
  }
}
