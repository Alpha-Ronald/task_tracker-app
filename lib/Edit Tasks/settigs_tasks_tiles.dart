import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Create New Habit/create_new_habit_page.dart';
import '../State Management/provider_sm.dart';

class HabitsTileEdits extends StatefulWidget {
  const HabitsTileEdits({
    super.key,
    required this.habitsTask,
  });

  final Task habitsTask;

  @override
  State<HabitsTileEdits> createState() => _HabitsTileEditsState();
}

class _HabitsTileEditsState extends State<HabitsTileEdits> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Container(
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
                  widget.habitsTask.name,
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
            PopUpOptions(task: widget.habitsTask)
          ])),
    );
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
                  builder: (context) => CreateNewHabitPage(
                      buttonTitle: 'Edit Habit', task: task)));
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

class HabitsListBuilder2 extends StatefulWidget {
  const HabitsListBuilder2({super.key});

  @override
  State<HabitsListBuilder2> createState() => HabitsListBuilder2State();
}

class HabitsListBuilder2State extends State<HabitsListBuilder2> {
  @override
  Widget build(BuildContext context) {
    var taskModel = Provider.of<TaskModel>(context);
    return ListView.builder(
      //physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: taskModel.habitsList.length,
      itemBuilder: (context, index) {
        final taskModel = Provider.of<TaskModel>(context, listen: false);
        return HabitsTileEdits(
          habitsTask: taskModel.habitsList[index],
        );
      },
    );
  }
}
