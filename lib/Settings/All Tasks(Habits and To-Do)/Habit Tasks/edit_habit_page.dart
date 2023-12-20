import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../Create New Habit/tasks_frequency.dart';
import '../../../State Management/provider_sm.dart';
import '../../../custom_appbars.dart';

class EditHabitPage extends StatelessWidget {
  const EditHabitPage(
      {super.key, required this.title, this.task, required this.onEdit});

  final String title;
  final Task? task;
  final Function(Task, String) onEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // Set the desired height
        child: CustomAppBar2(
          title: title,
        ),
      ),
      body: EditHabitBody(
        task: task,
        onEdit: onEdit,
      ),
    );
  }
}

class EditHabitBody extends StatefulWidget {
  const EditHabitBody({super.key, required this.task, required this.onEdit});

  final Task? task;
  final Function(Task, String) onEdit;

  @override
  State<EditHabitBody> createState() => EditHabitBodyState();
}

class EditHabitBodyState extends State<EditHabitBody> {
  //final controller = TextEditingController();

  final TextEditingController controller = TextEditingController();

  @override
  /*void initState() {
    controller.text = widget.task!.name;
    super.initState();
  }*/
  void initState() {
    if (widget.task != null) {
      controller.text = widget.task!.name ?? '';
    }
    super.initState();
  }

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
                TextFieldEdit(
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
                    final task = widget.task ?? Task(name: '');
                    widget.onEdit(task, controller.text);
                  },
                  /*() {
                    if (widget.task != null) {
                      context
                          .read<TaskModel>()
                          .updateTaskName(widget.task!, controller.text);
                      Navigator.pop(context);
                    }
                  }*/
                  /*{
                    final habitTaskName = controller.text;
                    if (habitTaskName.isNotEmpty) {
                      context.read<TaskModel>().addTask(habitTaskName, false);
                      Navigator.pop(context);
                      controller.clear();
                    }
                  }*/

                  splashColor: const Color(0xFF1D364D),
                  child: Container(
                    height: 60,
                    width: 165,
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D364D),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text('Edit goal',
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

class TextFieldEdit extends StatelessWidget {
  //TextField1({super.key, required TextEditingController controller});
  const TextFieldEdit({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 29,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: controller,
      decoration: const InputDecoration(
          hintText: 'Enter a title...',
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
