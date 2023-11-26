import 'package:flutter/material.dart';

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

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              Text(
                'Create a new habit',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
