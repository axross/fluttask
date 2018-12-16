import 'package:flutter/material.dart';
import 'package:fluttask/task_list_route_app_bar.dart';
import 'package:fluttask/with_scoped_model/new_task_floating_action_button.dart';
import 'package:fluttask/with_scoped_model/task_list.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildTaskListScreenAppBar(
          context,
          TaskListKind.WithScopedModel,
        ),
        body: TaskList(),
        floatingActionButton: NewTaskFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
}
