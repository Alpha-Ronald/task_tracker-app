import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  List<Task> habitsList = [
    Task(name: '5 prayers daily', completed: false),
    Task(name: 'Do exercise', completed: false),
    Task(name: '2 hours coding', completed: false),
  ];

  void addTask(String habitTaskName, bool completed) {
    habitsList.add(Task(name: habitTaskName, completed: completed));
    notifyListeners();
  }

  void removeTask(String habitTaskName) {
    habitsList.removeWhere((task) => task.name == habitTaskName);
    notifyListeners();
  }

  void habitsListCheckBoxChanged(bool? value, String taskName) {
    final task = habitsList.firstWhere((task) => task.name == taskName,
        orElse: () => Task(name: taskName, completed: false));
    task.completed = value ?? false;
    notifyListeners();
  }
}

class Task {
  Task({required this.name, this.completed = false});

  final String name;
  bool completed;
}
