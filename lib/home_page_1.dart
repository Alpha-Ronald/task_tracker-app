import 'package:flutter/material.dart';
import 'package:tryout/custom_homepage_widgets.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => HomePage1State();
}

class HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Column(children: [
        Column(
          children: [
            HabitsWidget(),
            BuildListView1(),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            ToDoWidget(),
            BuildListView2(),
          ],
        )
      ]),
      SizedBox(
        height: 60,
      ),
    ]);
  }
}
