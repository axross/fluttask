import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';
import 'package:meta/meta.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  final TaskStateChangeCallback onChangeTask;

  TaskList({
    @required this.tasks,
    @required this.onChangeTask,
  })  : assert(tasks != null),
        assert(onChangeTask != null);

  @override
  State<StatefulWidget> createState() => _TaskListState();
}

typedef void TaskStateChangeCallback(Task oldTask, Task newTask);

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => index < widget.tasks.length
          ? _buildTaskItem(widget.tasks[index])
          : _buildNewTaskCreater(),
      separatorBuilder: (context, index) => Divider(),
      itemCount: widget.tasks.length,
    );
  }

  Widget _buildTaskItem(Task task) => ListTile(
        title: Text(task.title),
        subtitle: task.isFinished
            ? Text(
                'Finished at ${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations).formatMediumDate(task.finishedAt)}')
            : null,
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

    widget.onChangeTask(task, task.finish());
  }

  void _unfinishTask(Task task) {
    assert(task.isFinished);

    widget.onChangeTask(task, task.unfinish());
  }
}