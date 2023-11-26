import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(
          height: 25,
        ),
        //First set of compulsory tasks widgets
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Container(
                    width: double.maxFinite,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.black12,
                      border: Border(
                          bottom: BorderSide(color: Colors.black38, width: 1)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Compulsory tasks.',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Icon(
                                CupertinoIcons.pin_fill,
                                color: Color(0xFF1D364D),
                                size: 20,
                              )
                            ]))))
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.maxFinite,
            height: 60,
            decoration: const BoxDecoration(shape: BoxShape.rectangle),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '5 daily prayers',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.maxFinite,
            height: 60,
            decoration: const BoxDecoration(shape: BoxShape.rectangle),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Thanksgiving',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
