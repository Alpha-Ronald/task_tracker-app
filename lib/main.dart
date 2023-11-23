import 'package:flutter/material.dart';

import 'home_page_body.dart';

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
        titleMedium: TextStyle(fontSize: 18, color: Colors.white),
        titleLarge: TextStyle(fontSize: 22, color: Colors.white),
        headlineSmall: TextStyle(
            fontSize: 18,
            color: Color(0xFF1D364D),
            fontWeight: FontWeight.bold)));

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
        child: CustomAppBar(),
      ),
      body: const HomePageBody(),
      /*body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Container(
                        width: double.maxFinite,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0x66000000),
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black38, width: 2)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('Compulsory tasks.'),
                        )))
              ],
            ))*/
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      flexibleSpace:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  Text('22 November 2023',
                      style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 29,
                )))
      ]),
    );
  }
}
