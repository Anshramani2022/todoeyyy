import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        deadline: "asdfghj",
        task: "rthjhg",
        date: DateFormat('dd-MM-yyyy').format(DateTime.now())),
  ];

  TextEditingController? taskController = TextEditingController();
  TextEditingController? deadLineController = TextEditingController();

  List<Task> get tasks => _tasks;

  get getSize => _tasks.length;

  addTask({String? newTask, String? newDeadline, String? date}) {
    final task = Task(task: newTask, deadline: newDeadline, date: date);
    _tasks.add(task);

    notifyListeners();
  }

  updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  deleteTask(item) {
    _tasks.remove(item);
    notifyListeners();
  }
}
