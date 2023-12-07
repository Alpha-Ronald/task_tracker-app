import 'package:flutter/material.dart';
import 'package:tryout/Home%20Page/custom_widgets.dart';

import '../custom_appbars.dart';
import 'List Views/listviewbuilders.dart';
import 'buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(105.0), // Set the desired height
          child: CustomAppBar1(),
        ),
        body: const HomePageBody(),
        floatingActionButton: const AddNewTaskButton());
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Column(children: [
        Column(
          children: [
            HabitsWidget(),
            HabitsListBuilder(),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            ToDoWidget(),
            ToDoListBuilder(),
          ],
        )
      ]),
      SizedBox(
        height: 60,
      ),
    ]);
  }
}
