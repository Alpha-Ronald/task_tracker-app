import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryout/provider_sm.dart';

class HabitsTile extends StatelessWidget {
  const HabitsTile({
    super.key,
    required this.habitTaskName,
    required this.habitTaskCompleted,
    required this.onChanged,
  });

  final String habitTaskName;
  final bool habitTaskCompleted;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, taskModel, child) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
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
                      habitTaskName,
                      style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                        decoration: habitTaskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    Checkbox(
                      value: habitTaskCompleted,
                      onChanged: (value) =>
                          taskModel.habitsListCheckBoxChanged(
                              value, habitTaskName),
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
    });
  }
}

class ToDoTaskTile extends StatelessWidget {
  final String toDoTaskName;
  final bool toDoTaskCompleted;
  final void Function(bool?)? onChanged;

  const ToDoTaskTile({super.key,
    required this.toDoTaskName,
    required this.toDoTaskCompleted,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
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
                    toDoTaskName,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(
                      decoration: toDoTaskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Checkbox(
                    value: toDoTaskCompleted,
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
