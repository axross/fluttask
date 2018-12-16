import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fluttask/with_stateful_widget/task_list_screen.dart';
import 'package:fluttask/with_scoped_model/task_list_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttask',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TaskListScreen(),
      builder: (context, child) => ScopedModel(
            model: TaskListModel(),
            child: child,
          ),
    );
  }
}
