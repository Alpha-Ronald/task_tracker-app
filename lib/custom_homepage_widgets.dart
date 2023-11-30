import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryout/provider_sm.dart';
import 'package:tryout/tiles.dart';

class HabitsWidget extends StatelessWidget {
  const HabitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2.5),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Container(
                width: double.maxFinite,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black12,
                  border: Border(
                      bottom: BorderSide(color: Colors.black38, width: 1)),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'HabitHarbor.',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const Icon(
                            CupertinoIcons.pin_fill,
                            color: Color(0xFF1D364D),
                            size: 20,
                          )
                        ])))));
  }
}

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2.5),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Container(
                width: double.maxFinite,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black12,
                  border: Border(
                      bottom: BorderSide(color: Colors.black38, width: 1)),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To-DO list.',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ])))));
  }
}

class BuildListView1 extends StatefulWidget {
  const BuildListView1({super.key});

  @override
  State<BuildListView1> createState() => BuildListView1State();
}

class BuildListView1State extends State<BuildListView1> {
//checkbox tapped

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
            habitTaskName: taskModel.habitsList[index].name,
            habitTaskCompleted: taskModel.habitsList[index].completed,
            onChanged: (value) => taskModel.habitsListCheckBoxChanged(
                value, taskModel.habitsList[index].name));
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
