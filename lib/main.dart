import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fluttask/with_scoped_model/task_list_model.dart';
import 'package:fluttask/with_stateful_widget/task_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: TaskListModel(),
      child: MaterialApp(
        title: 'Fluttask',
        theme: ThemeData(
          fontFamily: 'Rubik',
          primarySwatch: Colors.red,
        ),
        home: TaskListScreen(),
      ),
    );
  }
}
