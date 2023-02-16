import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/example/example.dart';
import 'package:todo_app_class/widgets/task_tile.dart';

import '../model/TaskData.dart';
import '../model/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TaskData>(context).count,
        itemBuilder: (context, index) {
          return TaskTile(
            task: Provider.of<TaskData>(context).tasks[index],
          );
        });
  }
}
