import 'package:flutter/material.dart';
import 'package:tryout/custom_appbars.dart';
import 'package:tryout/widgets.dart';

class CreateNewHabit extends StatelessWidget {
  const CreateNewHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90), // Set the desired height
        child: CustomAppBar2(),
      ),
      body: const CreateNewHabitBody(),
    );
  }
}

class CreateNewHabitBody extends StatefulWidget {
  const CreateNewHabitBody({super.key});

  @override
  State<CreateNewHabitBody> createState() => CreateNewHabitBodyState();
}

class CreateNewHabitBodyState extends State<CreateNewHabitBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField1(),
              SizedBox(
                height: 40,
              ),
              TaskFrequency(),
            ],
          ),
        )
      ],
    );
  }
}

class TaskFrequency extends StatefulWidget {
  const TaskFrequency({super.key});

  @override
  State<TaskFrequency> createState() => TaskFrequencyState();
}

class TaskFrequencyState extends State<TaskFrequency> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Text(
        'How often do you want to reach this goal',
        style: TextStyle(fontSize: 10),
      )
    ]);
  }
}
