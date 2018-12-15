import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';
import 'package:meta/meta.dart';

class TaskList extends StatefulWidget {
  final TasksChangeCallback onChangeTasks;

  TaskList({@required this.onChangeTasks}) : assert(onChangeTasks != null);

  @override
  State<StatefulWidget> createState() => _TaskListState();
}

typedef void TasksChangeCallback(List<Task> tasks);

class _TaskListState extends State<TaskList> {
  List<Task> _tasks = [
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
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => index < _tasks.length
          ? _buildTaskItem(_tasks[index])
          : _buildNewTaskCreater(),
      separatorBuilder: (context, index) => Divider(),
      itemCount: _tasks.length,
    );
  }

  Widget _buildTaskItem(Task task) => ListTile(
        title: Text(task.title),
        leading: task.isFinished
            ? IconButton(
                icon: Icon(Icons.check, color: Theme.of(context).primaryColor),
                onPressed: () => _unfinishTask(task),
              )
            : IconButton(
                icon: Icon(Icons.check, color: Theme.of(context).disabledColor),
                onPressed: () => _finishTask(task),
              ),
      );

  Widget _buildNewTaskCreater() => Container();

  void _finishTask(Task task) {
    assert(!task.isFinished);

    setState(() {
      _tasks[_tasks.indexOf(task)] = task.finish();
    });
  }

  void _unfinishTask(Task task) {
    assert(task.isFinished);

    setState(() {
      _tasks[_tasks.indexOf(task)] = task.unfinish();
    });
  }
}
