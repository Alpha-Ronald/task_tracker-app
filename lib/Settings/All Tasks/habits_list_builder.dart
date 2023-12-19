import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../State Management/provider_sm.dart';
import 'habits_list_tile.dart';

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
        return HabitsTasksTile(
          habitsTask: taskModel.habitsList[index],
        );
      },
    );
  }
}
