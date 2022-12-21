import 'package:flutter/material.dart';
import 'package:wishlist/preferences/custom_preferences.dart';
import 'package:wishlist/providers/providers.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "SETTINGS",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        SwitchListTile.adaptive(
          title: const Text("Dark theme"),
          value: CustomPreferences.isDark,
          onChanged: (value) => themeProvider.setTheme(value),
        ),
      ],
    );
  }
}
