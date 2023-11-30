import 'package:flutter/material.dart';

import 'create_new_habit.dart';

class HomePageAddButton extends StatelessWidget {
  const HomePageAddButton({super.key});

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

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox(
      {super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.value);
        }
      },
      child: Container(
        width: 22.0, // Set your preferred size
        height: 22.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF1D364D), // Set the border color
            width: 2.0, // Set the border width
          ),
        ),
        child: widget.value
            ? const Icon(
                Icons.circle,
                size: 14.0, // Set the check icon size
                color: Color(0xFF1D364D), // Set the check icon color
              )
            : Container(), // Empty container when not checked
      ),
    );
  }
}
