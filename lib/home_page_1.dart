import 'package:flutter/material.dart';
import 'package:tryout/Tiles.dart';
import 'package:tryout/widgets.dart';

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
            BuildListView(),
          ],
        )
      ])
    ]);
  }
}


class BuildListView extends StatefulWidget {
  const BuildListView({super.key});

  @override
  State<BuildListView> createState() => BuildListViewState();
}

class BuildListViewState extends State<BuildListView> {
  List toDoList = [
    ['5 prayers daily', false],
    ['Do exercise', false],
  ];

//checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: toDoList.length,
      itemBuilder: (context, index) {
        return HabitsTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index));
      },
    );
  }
}
