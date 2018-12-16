import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';
import 'package:meta/meta.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  final TaskCallback onFinishTask;
  final TaskCallback onUnfinishTask;
  final TaskCallback onDeleteTask;

  TaskList({
    @required this.tasks,
    @required this.onFinishTask,
    @required this.onUnfinishTask,
    @required this.onDeleteTask,
  })  : assert(tasks != null),
        assert(onFinishTask != null),
        assert(onUnfinishTask != null),
        assert(onDeleteTask != null);

  @override
  State<StatefulWidget> createState() => _TaskListState();
}

typedef void TaskCallback(Task task);

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) =>
            _buildTaskItem(context, widget.tasks[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: widget.tasks.length,
      );

  Widget _buildTaskItem(BuildContext context, Task task) => ListTile(
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
        trailing: PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: TaskActions.Delete,
                  child: ListTile(
                    title: Text('Delete'),
                    leading: Icon(Icons.delete),
                  ),
                ),
              ],
          onSelected: (value) {
            switch (value) {
              case TaskActions.Delete:
                widget.onDeleteTask(task);
                break;
            }
          },
        ),
      );

  void _finishTask(Task task) {
    assert(!task.isFinished);

    widget.onFinishTask(task);
  }

  void _unfinishTask(Task task) {
    assert(task.isFinished);

    widget.onUnfinishTask(task);
  }
}

enum TaskActions { Delete }
