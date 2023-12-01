import 'package:flutter/material.dart';

import 'custom_appbars.dart';

class EditTasks extends StatefulWidget {
  const EditTasks({super.key});

  @override
  State<EditTasks> createState() => EditTasksState();
}

class EditTasksState extends State<EditTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90), // Set the desired height
        child: CustomAppBar2(
          title: "My Habits and To-Do's",
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EditTaskOptions(taskOption: 'Habits'),
                EditTaskOptions(taskOption: 'To-Do')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EditTaskOptions extends StatelessWidget {
  const EditTaskOptions({super.key, required this.taskOption});

  final String taskOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 175,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: const Color(0xFF1D364D).withOpacity(0.1)),
          child: Text(
            taskOption,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 20),
          )),
    );
  }
}

//Color(0xFF1D364D)
