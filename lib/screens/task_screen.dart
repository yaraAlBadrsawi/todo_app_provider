import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/widgets/tasks_list.dart';

import '../core/model/TaskData.dart';
import '../core/model/task.dart';


class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTask = '';
    List<Task> tasks = [
      Task(title: 'Buy Milk'),
      Task(title: 'Buy bread'),
      Task(title: 'Buy bicycle'),
    ];
    return Scaffold(
      backgroundColor: Color(0xff555B6E),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff555B6E), fontSize: 24),
                    ),
                    TextField(
                      onChanged: (value) {
                        newTask = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        tasks.add(Task(title: newTask));
                        if (newTask.isNotEmpty) {
                          Provider.of<TaskData>(context, listen: false)
                              .add(newTask);
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff555B6E),
                      ),
                      child: const Text('ADD'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Color(0xff555B6E),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 24, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xffC9CDDA),
                  child: Icon(
                    Icons.list,
                    size: 32,
                    color: Color(0xff555B6E),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'To Do',
                  style: TextStyle(
                      color: Color(0xffC9CDDA),
                      fontSize: 54,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).count} task',
                  style: const TextStyle(
                    color: Color(0xffC9CDDA),
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffC9CDDA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: TasksList(tasks: tasks),
            ),
          )
        ],
      ),
    );
  }
}
