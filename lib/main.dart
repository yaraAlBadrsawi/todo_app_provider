import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/screens/task_screen.dart';

import 'example/example.dart';
import 'model/TaskData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
        create: (_) => TaskData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TasksScreen(),
        ));
  }
}
