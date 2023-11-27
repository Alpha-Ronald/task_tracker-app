import 'package:flutter/material.dart';

import 'buttons.dart';
import 'custom_appbars.dart';
import 'home_page_1.dart';

void main() {
  runApp(const MyApp());
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

//0xFFD4E1FF
//#1d364d
//0xFF1D364D
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(105.0), // Set the desired height
          child: CustomAppBar1(),
        ),
        body: const HomePage1(),
        floatingActionButton: const AddNewButton());
  }
}
