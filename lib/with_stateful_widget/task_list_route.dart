import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';
import 'package:fluttask/task_list.dart';
import 'package:fluttask/new_task_floating_action_button.dart';

class TaskListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskListRouteState();
}

class _TaskListRouteState extends State<StatefulWidget> {
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
        appBar: AppBar(
          title: Text('with StatefulWidget'),
          elevation: 1,
        ),
        body: TaskList(tasks: _tasks, onChangeTask: _replaceTask),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('All'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Unfinished'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Finished'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          onTap: (tappedIndex) => print(tappedIndex),
        ),
        floatingActionButton:
            NewTaskFloatingActionButton(onAddNewTask: _addTask),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void _replaceTask(Task oldTask, Task newTask) {
    setState(() {
      _tasks[_tasks.indexOf(oldTask)] = newTask;
    });
  }

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }
}
