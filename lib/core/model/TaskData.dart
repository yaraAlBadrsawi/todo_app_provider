import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(tiltle: 'buy phone'),
    Task(tiltle: 'buy phone'),
    Task(tiltle: 'buy phone'),
  ];

  int get count {
    return tasks.length;
  }

  Task showTask(int index) {
    // return UnmodifiableListView(source)
    return tasks[index];
  }

  void toggle(Task task) {
    task.toggleTask();
    notifyListeners();
  }

  void add(String title) {
    tasks.add(Task(tiltle: title));
    notifyListeners();
  }

  void delete(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
