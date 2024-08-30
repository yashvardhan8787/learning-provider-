import 'package:flutter/material.dart';
import 'package:learning_provider/Favrouite/favourite_screen.dart';
import 'package:learning_provider/Favrouite/theme_controller_screen.dart';
import 'package:learning_provider/View/ExampleTwoScreen.dart';
import 'package:learning_provider/View/MyHomePageScreen.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:learning_provider/provider/exmaple_two_provider.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:learning_provider/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider()),
        ChangeNotifierProvider<ExampleTwoProvider>(create: (_) => ExampleTwoProvider()),
        ChangeNotifierProvider<FavouriteProvider>(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider<ThemeChangerProvider>(create:(_)=>ThemeChangerProvider(), )
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.cyan,
            useMaterial3: true,
          ),
          home:ThemeControllerScreen(),
        );
      },)
    );
  }
}
