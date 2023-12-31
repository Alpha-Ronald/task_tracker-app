import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryout/State%20Management/provider_sm.dart';
import 'package:tryout/custom_appbars.dart';

import 'tasks_frequency.dart';

class CreateNewHabitPage extends StatelessWidget {
  const CreateNewHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90), // Set the desired height
        child: CustomAppBar2(
          title: 'Create a new habit',
        ),
      ),
      body: const CreateNewHabitBody(),
    );
  }
}

class CreateNewHabitBody extends StatefulWidget {
  const CreateNewHabitBody({super.key, this.task});

  final Task? task;

  @override
  State<CreateNewHabitBody> createState() => CreateNewHabitBodyState();
}

class CreateNewHabitBodyState extends State<CreateNewHabitBody> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, taskModel, _) {
      return ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFieldCreate(
                  controller: controller,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          const TaskFrequency(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    final habitTaskName = controller.text;
                    if (habitTaskName.isNotEmpty) {
                      context.read<TaskModel>().addTask(habitTaskName, false);
                      Navigator.pop(context);
                      controller.clear();
                    }
                  },
                  /*() {
                    if (editingTask != null) {
                      editingTask!.name = controller.text; // Update task name
                      context
                          .read<TaskModel>()
                          .updateTaskName(editingTask!, controller.text);
                      Navigator.pop(context);
                      controller.clear();
                    }
                  },*/
                  /*{
                    final habitTaskName = controller.text;
                    if (habitTaskName.isNotEmpty) {
                      context.read<TaskModel>().addTask(habitTaskName, false);
                      Navigator.pop(context);
                      controller.clear();
                    }
                  },*/
                  splashColor: const Color(0xFF1D364D),
                  child: Container(
                    height: 60,
                    width: 165,
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D364D),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text('Create goal',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.white70))),
                  ))
            ],
          )
        ],
      );
    });
  }
}

class TextFieldCreate extends StatelessWidget {
  //TextField1({super.key, required TextEditingController controller});
  const TextFieldCreate({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 29,
      controller: controller,
      decoration: const InputDecoration(
          //hintText: 'Enter a title...',
          hintText: 'New Habit title...',
          hintStyle: TextStyle(fontSize: 40, color: Colors.black26),
          //focusColor: Color(0xFF1D364D),
          border: InputBorder.none),
      cursorHeight: 40,
      cursorColor: const Color(0xFF1D364D),
      style: const TextStyle(color: Colors.black, fontSize: 40),
    );
  }
}

class SetTime extends StatelessWidget {
  const SetTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: TextField(
                cursorColor: Color(0xFF1D364D),
                style: TextStyle(color: Color(0xFF1D364D), fontSize: 35),
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            ':',
            style: TextStyle(fontSize: 45),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 70,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: TextField(
                cursorColor: Color(0xFF1D364D),
                style: TextStyle(color: Color(0xFF1D364D), fontSize: 35),
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
