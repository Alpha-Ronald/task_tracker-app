import 'package:flutter/material.dart';

import 'page_create_new.dart';

class AddNewButton extends StatelessWidget {
  const AddNewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateNewHabit()));
        },
        backgroundColor: const Color(0xFF1D364D),
        tooltip: 'Add new Habit/Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
