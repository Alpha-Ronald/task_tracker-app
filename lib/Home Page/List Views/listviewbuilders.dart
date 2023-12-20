import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../State Management/provider_sm.dart';
import 'tiles.dart';

class HabitsListBuilder1 extends StatefulWidget {
  const HabitsListBuilder1({super.key});

  @override
  State<HabitsListBuilder1> createState() => HabitsListBuilder1State();
}

class HabitsListBuilder1State extends State<HabitsListBuilder1> {
  @override
  Widget build(BuildContext context) {
    var taskModel = Provider.of<TaskModel>(context);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: taskModel.habitsList.length,
      itemBuilder: (context, index) {
        final taskModel = Provider.of<TaskModel>(context, listen: false);
        return HabitsTile(
            habitTaskName: taskModel.habitsList[index].name ?? '',
            habitTaskCompleted: taskModel.habitsList[index].completed,
            onChanged: (value) => taskModel.habitsListCheckBoxChanged(
                value, taskModel.habitsList[index].name ?? ''));
      },
    );
  }
}

class ToDoListBuilder extends StatefulWidget {
  const ToDoListBuilder({super.key});

  @override
  State<ToDoListBuilder> createState() => ToDoListBuilderState();
}

class ToDoListBuilderState extends State<ToDoListBuilder> {
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
        physics: const NeverScrollableScrollPhysics(),
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
