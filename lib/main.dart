import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryout/provider_sm.dart';

import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TaskModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      home: const HomePage(),
    );
  }
}

final ThemeData customTheme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: const Color(0xFFD4E1FF)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1D364D)),
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 18, color: Colors.white70),
        titleLarge: TextStyle(fontSize: 22, color: Colors.white70),
        headlineSmall: TextStyle(
            fontSize: 18,
            color: Color(0xFF1D364D),
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
          fontSize: 18,
          color: Color(0xFF1D364D),
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          color: Colors.white,
        )));

//0xFF D4E1FF
//#1d364d
//0xFF 1D364D
//0xFFD2FAED
//d2faed
