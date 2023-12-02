import 'package:flutter/material.dart';
import 'package:tryout/Settings/settings_page.dart';

class CustomAppBar1 extends StatelessWidget {
  const CustomAppBar1({super.key});

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
                        color: Colors.white70,
                      ))
                ],
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                splashColor: const Color(0xFF1D364D),
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white70,
                  size: 29,
                )))
      ]),
    );
  }
}

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 32,
                  ),
                  color: Colors.white70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
