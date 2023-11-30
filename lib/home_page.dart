import 'package:flutter/material.dart';
import 'package:tryout/custom_homepage_widgets.dart';

import 'buttons_and_checkboxes.dart';
import 'custom_appbars.dart';

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
        floatingActionButton: const HomePageAddButton());
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
            BuildListView1(),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            ToDoWidget(),
            BuildListView2(),
          ],
        )
      ]),
      SizedBox(
        height: 60,
      ),
    ]);
  }
}
