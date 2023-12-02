import 'package:flutter/material.dart';

import 'Conditional Activation widgets/repeat_option_widgets_activation.dart';
import 'check_box.dart';
import 'create_new_habit_page.dart';

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
                //widget includes conditional activation styling for the repeat bool option
                RepeatOptionActivation(
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
        //activating the 'set a reminder' widgets
        if (onChecked)
          Visibility(
            visible: onChecked,
            child: const SetTime(),
          ),
      ],
    );
  }
}
