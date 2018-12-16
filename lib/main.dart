import 'package:flutter/material.dart';
import 'package:fluttask/with_stateful_widget/task_list_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttask',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TaskListRoute(),
    );
  }
}
