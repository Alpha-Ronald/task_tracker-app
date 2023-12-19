import 'package:flutter/material.dart';
import '../../Home Page/buttons.dart';
import '../../custom_appbars.dart';
import 'habits_list_builder.dart';
import 'tasks_options_activation.dart';

class EditTasksPage extends StatefulWidget {
  const EditTasksPage({super.key});

  @override
  State<EditTasksPage> createState() => EditTasksPageState();
}

class EditTasksPageState extends State<EditTasksPage> {
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
        body: Padding(
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
              if (showHabitsList)
                const HabitsListBuilder2()
              else
                const HabitsListBuilder2(),
            ],
          ),
        ),
        floatingActionButton: const AddNewTaskButton());
  }
}

//Color(0xFF1D364D)
