import 'package:flutter/material.dart';

import '../Create New Habit/create_new_habit_page.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateNewHabitPage(
                        buttonTitle: '',
                      )));
        },
        backgroundColor: const Color(0xFF1D364D),
        tooltip: 'Add new Habit/Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
