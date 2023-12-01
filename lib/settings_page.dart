import 'package:flutter/material.dart';
import 'package:tryout/edit_tasks_page.dart';

import 'custom_appbars.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90), // Set the desired height
        child: CustomAppBar2(
          title: 'Settings',
        ),
      ),
      body: Column(
        children: [
          SettingsOptions(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditTasks()));
            },
            option: "My Habits and To-Do's",
            iconData: Icons.emoji_events_outlined,
          ),
          SettingsOptions(
            option: "Share this app",
            iconData: Icons.share_outlined,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  const SettingsOptions(
      {super.key, required this.option, this.onTap, required this.iconData});

  final String option;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 28,
                color: const Color(0xFF1D364D),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                option,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20),
              )
            ],
          ),
          InkWell(
            onTap: onTap,
            splashColor: const Color(0xFF1D364D),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 22,
            ),
          )
        ],
      ),
    );
  }
}
