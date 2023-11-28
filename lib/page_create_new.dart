import 'package:flutter/material.dart';
import 'package:tryout/custom_appbars.dart';

import 'buttons_and_checkboxes.dart';

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
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            )
          ],
        )
      ],
    );
  }
}

class RepeatConditionalActivationWidget extends StatefulWidget {
  const RepeatConditionalActivationWidget(
      {super.key, required this.repeatCheckBoxValue});

  final bool repeatCheckBoxValue; //calling the repeatCheckBoxValue value

  @override
  State<RepeatConditionalActivationWidget> createState() =>
      RepeatConditionalActivationWidgetState();
}

class RepeatConditionalActivationWidgetState
    extends State<RepeatConditionalActivationWidget> {
  @override
  Widget build(BuildContext context) {
    //Text conditional activation colors
    Color textColor = widget.repeatCheckBoxValue
        ? const Color(0xFF1D364D)
        : const Color(0xFF1D364D).withOpacity(0.2);
    //Start Date conditional activation colors
    Color startDateInsideContainerColor = widget.repeatCheckBoxValue
        ? Colors.green.withOpacity(0.2)
        : const Color(0Xffe1f2ed).withOpacity(0.2);
    Color startDateContainerBorderColor = widget.repeatCheckBoxValue
        ? Colors.green
        : Colors.green.withOpacity(0.2);

    //End Date conditional activation colors
    Color endDateColor = widget.repeatCheckBoxValue
        ? Colors.red.withOpacity(0.2)
        : Colors.red.withOpacity(0.05);
    Color endDateContainerBorderColor =
        widget.repeatCheckBoxValue ? Colors.red : Colors.red.withOpacity(0.2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'When do you want to reach this goal?',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 16, color: textColor),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Start date:',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: textColor),
            ),
            Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                    color: startDateInsideContainerColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: startDateContainerBorderColor,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 16, color: textColor)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        )
                      ]),
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'End date:',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: textColor),
            ),
            Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                    color: endDateColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: endDateContainerBorderColor,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 16, color: textColor)),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        )
                      ]),
                ))
          ],
        ),
      ],
    );
  }
}
