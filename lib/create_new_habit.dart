import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryout/custom_appbars.dart';
import 'package:tryout/provider_sm.dart';

import 'buttons_and_checkboxes.dart';
import 'conditional_activation.dart';

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
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var taskModel = Provider.of<TaskModel>(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField1(
                controller: controller,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        const TaskFrequency(),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  String newTask = controller.text;
                  if (newTask.isNotEmpty) {
                    taskModel.addTask(newTask, false);
                    controller.clear();
                  }
                },
                splashColor: const Color(0xFF1D364D),
                child: Container(
                  height: 60,
                  width: 165,
                  decoration: BoxDecoration(
                      color: const Color(0xFF1D364D),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('Create goal',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: Colors.white70))),
                ))
          ],
        )
      ],
    );
  }
}

class TextField1 extends StatelessWidget {
  TextField1({super.key, required TextEditingController controller});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
          hintText: 'Enter a title...',
          hintStyle: TextStyle(fontSize: 40, color: Colors.black26),
          //focusColor: Color(0xFF1D364D),
          border: InputBorder.none),
      cursorHeight: 40,
      cursorColor: const Color(0xFF1D364D),
      style: const TextStyle(color: Colors.black, fontSize: 40),
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
  bool onChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                const SizedBox(
                  height: 40,
                ),
                RepeatConditionalActivationWidget(
                  repeatCheckBoxValue: repeatCheckBoxValue,
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Checkbox(
                  activeColor: const Color(0xFF1D364D),
                  value: onChecked,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      setState(() {
                        onChecked = newValue;
                      });
                    }
                  },
                  fillColor:
                      MaterialStateProperty.all(const Color(0xFF1D364D))),
              Text('Set a reminder',
                  style: Theme.of(context).textTheme.displaySmall)
            ],
          ),
        ),
        if (onChecked)
          Visibility(
            visible: onChecked,
            child: const SetReminder(),
          ),
      ],
    );
  }
}

class SetReminder extends StatelessWidget {
  const SetReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: TextField(
                cursorColor: Color(0xFF1D364D),
                style: TextStyle(color: Color(0xFF1D364D), fontSize: 35),
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            ':',
            style: TextStyle(fontSize: 45),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 70,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: TextField(
                cursorColor: Color(0xFF1D364D),
                style: TextStyle(color: Color(0xFF1D364D), fontSize: 35),
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
