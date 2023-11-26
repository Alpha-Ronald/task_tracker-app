import 'package:flutter/material.dart';
import 'package:tryout/tiles.dart';
import 'package:tryout/widgets.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => HomePage1State();
}

class HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Column(children: [
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
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFF1D364D),
              //tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    ]);
  }
}

class BuildListView1 extends StatefulWidget {
  const BuildListView1({super.key});

  @override
  State<BuildListView1> createState() => BuildListView1State();
}

class BuildListView1State extends State<BuildListView1> {
  List habitsList = [
    ['5 prayers daily', false],
    ['Do exercise', false],
    ['Do exercise', false],
  ];

//checkbox tapped
  void habitsListCheckBoxChanged(bool? value, int index) {
    setState(() {
      habitsList[index][1] = !habitsList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: habitsList.length,
      itemBuilder: (context, index) {
        return HabitsTile(
            habitTaskName: habitsList[index][0],
            habitTaskCompleted: habitsList[index][1],
            onChanged: (value) => habitsListCheckBoxChanged(value, index));
      },
    );
  }
}

class BuildListView2 extends StatefulWidget {
  const BuildListView2({super.key});

  @override
  State<BuildListView2> createState() => BuildListView2State();
}

class BuildListView2State extends State<BuildListView2> {
  List toDoList = [
    ['5 prayers daily', false],
    ['Do exercise', false],
    ['Do exercise', false],
  ];

  void toDoListCheckBoxChanged(bool? value, int index) {
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
          return ToDoTaskTile(
              toDoTaskName: toDoList[index][0],
              toDoTaskCompleted: toDoList[index][1],
              onChanged: (value) => toDoListCheckBoxChanged(value, index));
        });
  }
}
