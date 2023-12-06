import 'package:flutter/material.dart';

class EditTaskOptions extends StatefulWidget {
  const EditTaskOptions({
    super.key,
    required this.showHabitsList,
    required this.onHabitPressed,
    required this.onTodoPressed,
  });

  final bool showHabitsList;
  final VoidCallback onHabitPressed;
  final VoidCallback onTodoPressed;

  @override
  State<EditTaskOptions> createState() => _EditTaskOptionsState();
}

class _EditTaskOptionsState extends State<EditTaskOptions> {
  @override
  Widget build(BuildContext context) {
    // habits button conditional activation
    Color habitsButtonTextColor = widget.showHabitsList
        ? const Color(0xFF1D364D)
        : const Color(0xFF1D364D).withOpacity(0.2);
    Color habitsButtonBorderColor = widget.showHabitsList
        ? Colors.black
        : const Color(0xFF1D364D).withOpacity(0.1);

    // to-do button conditional activation
    Color todoButtonTextColor = !widget.showHabitsList
        ? const Color(0xFF1D364D)
        : const Color(0xFF1D364D).withOpacity(0.2);
    Color todoButtonBorderColor = !widget.showHabitsList
        ? Colors.black
        : const Color(0xFF1D364D).withOpacity(0.1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 70,
          width: 175,
          child: ElevatedButton(
            //logic disabling button when it is active
              onPressed: widget.showHabitsList ? null : widget.onHabitPressed,
              style: ElevatedButton.styleFrom(
                //
                  side: BorderSide(color: habitsButtonBorderColor, width: 1),
                  //

                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xFF1D364D).withOpacity(0.1)),
              child: Text(
                'Habits',
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20, color: habitsButtonTextColor),
              )),
        ),
        SizedBox(
          height: 70,
          width: 175,
          child: ElevatedButton(
              onPressed: !widget.showHabitsList ? null : widget.onTodoPressed,
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: todoButtonBorderColor, width: 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xFF1D364D).withOpacity(0.1)),
              child: Text(
                'To Do',
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20, color: todoButtonTextColor),
              )),
        ),
      ],
    );
  }
}
