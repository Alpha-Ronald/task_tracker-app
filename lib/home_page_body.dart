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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black38.withOpacity(0.15),
                  shape: BoxShape.rectangle,
                  border: const Border(
                      bottom: BorderSide(color: Colors.black38, width: 2)),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: const Text(
                  'ososvoov ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        )
      ],
    );
  }
}
