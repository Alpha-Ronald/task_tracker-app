import 'package:flutter/material.dart';

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
