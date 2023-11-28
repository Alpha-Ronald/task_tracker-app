import 'package:flutter/material.dart';
import 'package:tryout/custom_appbars.dart';

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
            ],
          ),
        ),
        TaskFrequency(),
      ],
    );
  }
}

class TextField1 extends StatelessWidget {
  const TextField1({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          hintText: 'Enter a title...',
          hintStyle: TextStyle(fontSize: 40, color: Colors.black26),
          //focusColor: Color(0xFF1D364D),
          border: InputBorder.none),
      cursorHeight: 40,
      cursorColor: Color(0xFF1D364D),
      style: TextStyle(color: Colors.black, fontSize: 40),
    );
  }
}

class TaskFrequency extends StatefulWidget {
  const TaskFrequency({super.key});

  @override
  State<TaskFrequency> createState() => TaskFrequencyState();
}

class TaskFrequencyState extends State<TaskFrequency> {
  bool onceCheckBoxValue = true;
  bool everydayCheckBoxValue = false;
  bool someDaysCheckBoxValue = false;
  bool repeatCheckBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How often do you want to reach this goal?',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CustomCheckBox(
                    value: onceCheckBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        onceCheckBoxValue = newValue;
                        if (newValue) {
                          everydayCheckBoxValue = false;
                          someDaysCheckBoxValue = false;
                          repeatCheckBoxValue = false;
                        }
                      });
                    },
                  ),
                ),
                Text(
                  'Once',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CustomCheckBox(
                    value: everydayCheckBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        everydayCheckBoxValue = newValue;
                        if (newValue) {
                          onceCheckBoxValue = false;
                          someDaysCheckBoxValue = false;
                          repeatCheckBoxValue = false;
                        }
                      });
                    },
                  ),
                ),
                Text(
                  'Every day',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CustomCheckBox(
                    value: someDaysCheckBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        someDaysCheckBoxValue = newValue;
                        if (newValue) {
                          everydayCheckBoxValue = false;
                          onceCheckBoxValue = false;
                          repeatCheckBoxValue = false;
                        }
                      });
                    },
                  ),
                ),
                Text(
                  'Some days in the week',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CustomCheckBox(
                    value: repeatCheckBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        repeatCheckBoxValue = newValue;
                        if (newValue) {
                          everydayCheckBoxValue = false;
                          onceCheckBoxValue = false;
                          someDaysCheckBoxValue = false;
                        }
                      });
                    },
                  ),
                ),
                Text(
                  'Repeat',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          ]),
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
