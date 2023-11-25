import 'package:flutter/material.dart';
import 'package:tryout/widgets.dart';

import 'Tiles.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => HomePage1State();
}

class HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        Column(
          children: [
            HabitsWidget(),
            HabitsTile(
                taskName: '5 daily Prayers',
                taskComleted: true,
                onChanged: () {})
          ],
        )
      ])
    ]);
  }
}
