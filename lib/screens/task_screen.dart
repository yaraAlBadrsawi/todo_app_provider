import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/core/resources/colors_mangaer.dart';
import 'package:todo_app_class/core/resources/fonts_manager.dart';
import 'package:todo_app_class/core/resources/icons_manager.dart';
import 'package:todo_app_class/core/resources/sizes_manager.dart';
import 'package:todo_app_class/core/resources/strings_manager.dart';
import 'package:todo_app_class/core/util/size_util.dart';
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
      backgroundColor: ManagerColors.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(ManagerRadius.r12),
                topLeft: Radius.circular(ManagerRadius.r12),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(ManagerWidth.w24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      ManagerStrings.addTask,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ManagerColors.primary,
                          fontSize: ManagerFontSize.s24),
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
                        backgroundColor: ManagerColors.primary,
                      ),
                      child: const Text(ManagerStrings.addTask),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: ManagerColors.primary,
        child: Icon(
          ManagerIcons.add,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: ManagerHeight.h80,
                bottom: ManagerHeight.h24,
                left: ManagerWidth.w24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: ManagerRadius.r30,
                  backgroundColor: ManagerColors.background,
                  child: Icon(
                    ManagerIcons.list,
                    size: ManagerIconSize.s32,
                    color: ManagerColors.primary,
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h12,
                ),
                Text(
                  ManagerStrings.ToDo,
                  style: TextStyle(
                      color: ManagerColors.background,
                      fontSize: ManagerFontSize.s50,
                      fontWeight: ManagerFontWeight.bold),
                ),
                Text(
                  '${Provider.of<TaskData>(context).count} task',
                  style: TextStyle(
                    color: ManagerColors.background,
                    fontSize: ManagerFontSize.s18,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ManagerColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ManagerRadius.r12),
                  topRight: Radius.circular(ManagerRadius.r12),
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
