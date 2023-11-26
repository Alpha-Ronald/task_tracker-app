import 'package:flutter/material.dart';
import 'package:tryout/custom_appbars.dart';

class CreateNew extends StatelessWidget {
  const CreateNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(105.0), // Set the desired height
        child: CustomAppBar2(),
      ),
      //body: ,
    );
  }
}
