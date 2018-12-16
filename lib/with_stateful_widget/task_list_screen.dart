import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';
import 'package:fluttask/task_list_route_app_bar.dart';
import 'package:fluttask/with_stateful_widget/new_task_floating_action_button.dart';
import 'package:fluttask/with_stateful_widget/task_list.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<StatefulWidget> {
  final List<Task> _tasks = [
    Task(title: 'Create a new flutter app', createdAt: DateTime.now()),
    Task(
        title: 'Edit code',
        createdAt: DateTime.now().add(Duration(seconds: 1)),
        finishedAt: DateTime.now().add(Duration(seconds: 100))),
    Task(
        title: 'Run the app on emulators',
        createdAt: DateTime.now().add(Duration(seconds: 2))),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildTaskListScreenAppBar(
          context,
          TaskListKind.WithStatefulWidget,
        ),
        body: TaskList(
          tasks: _tasks,
          onFinishTask: _finishTask,
          onUnfinishTask: _unfinishTask,
          onDeleteTask: _deleteTask,
        ),
        floatingActionButton:
            NewTaskFloatingActionButton(onAddNewTask: _addTask),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  void _finishTask(Task task) {
    setState(() {
      _tasks[_tasks.indexOf(task)] = task.finish();
    });
  }

  void _unfinishTask(Task task) {
    setState(() {
      _tasks[_tasks.indexOf(task)] = task.unfinish();
    });
  }

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }
}
