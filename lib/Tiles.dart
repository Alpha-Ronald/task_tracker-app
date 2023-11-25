import 'package:flutter/material.dart';

class HabitsTile extends StatelessWidget {
  const HabitsTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.maxFinite,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black12.withOpacity(0.05),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskName,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                  ),
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: const Color(0xFF1D364D),
                    shape: const CircleBorder(),
                    fillColor:
                        MaterialStateProperty.all(const Color(0xFF1D364D)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
