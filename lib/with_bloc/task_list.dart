import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';
import 'package:fluttask/with_bloc/tasks_consumer.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TasksConsumer(
        builder: (context, bloc) => StreamBuilder<List<Task>>(
            stream: bloc.tasksStream,
            initialData: bloc.tasks,
            builder: (context, snapshot) => ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) =>
                      _buildTaskItem(context, snapshot.data[index]),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data.length,
                )),
      );

  Widget _buildTaskItem(BuildContext context, Task task) => TasksConsumer(
        builder: (context, bloc) => ListTile(
              title: Text(task.title),
              subtitle: task.isFinished
                  ? Text(
                      'Finished at ${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations).formatMediumDate(task.finishedAt)}')
                  : null,
              leading: task.isFinished
                  ? IconButton(
                      icon: Icon(Icons.check,
                          color: Theme.of(context).primaryColor),
                      onPressed: () => bloc.unfinishing.add(task),
                    )
                  : IconButton(
                      icon: Icon(Icons.check,
                          color: Theme.of(context).disabledColor),
                      onPressed: () => bloc.finishing.add(task),
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
                      bloc.deletion.add(task);
                      break;
                  }
                },
              ),
            ),
      );
}

enum TaskActions { Delete }
