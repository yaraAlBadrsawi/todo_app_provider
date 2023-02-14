import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.title,
        style: TextStyle(
            decoration: widget.task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: MyCheckbox(
        isChecked: widget.task.isDone,
        func: (bool? value) {
          setState(() {
            widget.task.toggleTask();
          });
        },
      ),
    );
  }
}

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({
    Key? key,
    required this.isChecked,
    this.func,
  }) : super(key: key);

  final bool isChecked;
  final Function(bool?)? func;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: func,
    );
  }
}
