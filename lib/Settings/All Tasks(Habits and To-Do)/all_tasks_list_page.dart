import 'package:flutter/material.dart';

import '../../Home Page/buttons.dart';
import '../../custom_appbars.dart';
import 'Habit Tasks/habits_list_builder.dart';
import 'tasks_options_activation.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({super.key});

  @override
  State<AllTasksPage> createState() => AllTasksPageState();
}

class AllTasksPageState extends State<AllTasksPage> {
  bool showHabitsList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90), // Set the desired height
          child: CustomAppBar2(
            title: "My Habits and To-Do tasks",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                EditTaskOptions(
                  showHabitsList: showHabitsList,
                  onHabitPressed: () {
                    setState(() {
                      showHabitsList = !showHabitsList;
                    });
                  },
                  onTodoPressed: () {
                    setState(() {
                      showHabitsList = !showHabitsList;
                    });
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                showHabitsList
                    ? const HabitsListBuilder2()
                    : const HabitsListBuilder2(),
                /*if (showHabitsList)
                  const HabitsListBuilder2()
                else
                  const HabitsListBuilder2(),*/
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: const AddNewTaskButton());
  }
}

//Color(0xFF1D364D)
