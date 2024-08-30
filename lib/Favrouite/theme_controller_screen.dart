import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class ThemeControllerScreen extends StatefulWidget {
  const ThemeControllerScreen({super.key});

  @override
  State<ThemeControllerScreen> createState() => _ThemeControllerScreenState();
}

class _ThemeControllerScreenState extends State<ThemeControllerScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme handling "),
      ),
      body:Column(
        children: [
          RadioListTile(
            title: Text('light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,),
          RadioListTile(
            title: Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,),
          RadioListTile(
            title: Text('system Mode'),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,),
        ],
      ),
    );
  }
}
