import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../State Management/provider_sm.dart';
import 'edit_habit_page.dart';

class HabitsTasksTile extends StatefulWidget {
  const HabitsTasksTile({
    super.key,
    required this.habitsTask,
  });

  final Task habitsTask;

  @override
  State<HabitsTasksTile> createState() => _HabitsTasksTileState();
}

class _HabitsTasksTileState extends State<HabitsTasksTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, taskModel, child) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Container(
            height: 90,
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color(0xFF1D364D).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.habitsTask.name,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 20),
                      ),
                      Text(
                        '(Everyday)',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontSize: 15,
                                color:
                                    const Color(0xFF1D364D).withOpacity(0.5)),
                      )
                    ],
                  ),
                  //IconButton(onPressed: () {}, icon: Icon(more))
                  PopUpOptions(task: widget.habitsTask)
                ])),
      );
    });
  }
}

class PopUpOptions extends StatelessWidget {
  const PopUpOptions({super.key, required this.task});

  final Task task;

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditHabitPage(
                        title: '',
                      )));
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
