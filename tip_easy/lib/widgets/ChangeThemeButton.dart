import 'package:flutter/material.dart';
import 'package:tip_easy/themes.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Change theme mode',
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.brightness_7)
          : const Icon(Icons.brightness_3),
      onPressed: () {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        if (Theme.of(context).brightness == Brightness.light) {
          provider.toggleTheme(true);
        } else {
          provider.toggleTheme(false);
        }
      },
    );
  }
}
