import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fluttask/task.dart';
import 'package:fluttask/with_scoped_model/task_list_model.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<TaskListModel>(
        builder: (context, _, model) => ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) =>
                  _buildTaskItem(context, model.tasks[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: model.tasks.length,
            ),
      );

  Widget _buildTaskItem(BuildContext context, Task task) =>
      ScopedModelDescendant<TaskListModel>(
        builder: (context, _, model) => ListTile(
              title: Text(task.title),
              subtitle: task.isFinished
                  ? Text(
                      'Finished at ${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations).formatMediumDate(task.finishedAt)}')
                  : null,
              leading: task.isFinished
                  ? IconButton(
                      icon: Icon(Icons.check,
                          color: Theme.of(context).primaryColor),
                      onPressed: () => model.unfinishTask(task),
                    )
                  : IconButton(
                      icon: Icon(Icons.check,
                          color: Theme.of(context).disabledColor),
                      onPressed: () => model.finishTask(task),
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
                      model.deleteTask(task);
                      break;
                  }
                },
              ),
            ),
      );
}

enum TaskActions { Delete }
