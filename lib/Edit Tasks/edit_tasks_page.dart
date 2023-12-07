import 'package:flutter/material.dart';

import '../Home Page/buttons.dart';
import '../custom_appbars.dart';
import 'edit_tasks_options_activation.dart';

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
              /*if (showHabitsList)
                CustomTaskList()
              else
                CompulsoryTaskList(),*/
              const HabitsTileEdits(),
            ],
          ),
        ),
        floatingActionButton: const AddNewTaskButton());
  }
}

//Color(0xFF1D364D)

class HabitsTileEdits extends StatelessWidget {
  const HabitsTileEdits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xFF1D364D).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'habitsTaskName',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20),
              ),
              Text(
                '(Everyday)',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 15,
                    color: const Color(0xFF1D364D).withOpacity(0.5)),
              )
            ],
          ),
          //IconButton(onPressed: () {}, icon: Icon(more))
          const PopUpOptions()
        ]));
  }
}

class PopUpOptions extends StatelessWidget {
  const PopUpOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Color(0xFF1D364D)),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'edit',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.edit_note_outlined,
                color: Colors.white70,
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Edit',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20, color: Colors.white70),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.delete_forever_outlined,
                color: Colors.redAccent,
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Delete',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20, color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
      onSelected: (String value) {
        // Handle item selection
        if (value == 'edit') {
          // Handle edit action
        } else if (value == 'delete') {
          // Handle delete action
        }
      },
      color: const Color(0xFF1D364D).withOpacity(0.8),
      //Color(0xFFD4E1FF),
      offset: const Offset(20, -12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
