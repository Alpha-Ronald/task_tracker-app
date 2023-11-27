import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HabitsWidget extends StatelessWidget {
  const HabitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2.5),
        child: ClipRRect(
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
                            'HabitHarbor.',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const Icon(
                            CupertinoIcons.pin_fill,
                            color: Color(0xFF1D364D),
                            size: 20,
                          )
                        ])))));
  }
}

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2.5),
        child: ClipRRect(
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
                            'To-DO list.',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          /*const Icon(
                            CupertinoIcons.pin_fill,
                            color: Color(0xFF1D364D),
                            size: 20,
                          )*/
                        ])))));
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
