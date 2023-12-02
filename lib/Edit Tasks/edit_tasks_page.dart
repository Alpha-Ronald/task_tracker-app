import 'package:flutter/material.dart';

import '../custom_appbars.dart';

class EditTasksPage extends StatefulWidget {
  const EditTasksPage({super.key});



  @override
  State<EditTasksPage> createState() => EditTasksPageState();
}

class EditTasksPageState extends State<EditTasksPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EditTaskOptions(
                  taskOption: 'Habits',
                  onSelected: () {},
                ),
                EditTaskOptions(
                  taskOption: 'To-Do',
                  onSelected: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EditTaskOptions extends StatelessWidget {
  const EditTaskOptions(
      {super.key, required this.taskOption, required this.onSelected});

  final String taskOption;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 175,
      child: ElevatedButton(
          onPressed: onSelected,
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
