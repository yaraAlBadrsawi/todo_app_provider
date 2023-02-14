import 'package:flutter/material.dart';
import 'package:todo_app_class/widgets/task_tile.dart';

import '../model/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
          );
        });
  }
}
