import 'package:flutter/material.dart';
import 'package:fluttask/with_scoped_model/task_list_route.dart'
    as withScopedModel;
import 'package:fluttask/with_stateful_widget/task_list_route.dart'
    as withStatefulWidget;

Widget buildTaskListScreenAppBar(BuildContext context, TaskListKind kind) =>
    AppBar(
      title: Text(_getTitle(kind)),
      elevation: 1,
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: TaskListKind.WithStatefulWidget,
                  child: Text('with Stateful Widget'),
                ),
                PopupMenuItem(
                  value: TaskListKind.WithScopedModel,
                  child: Text('with Scoped Model'),
                ),
              ],
          onSelected: (value) {
            switch (value) {
              case TaskListKind.WithStatefulWidget:
                Navigator.of(context)
                    .pushReplacement(withStatefulWidget.createTaskListRoute());
                break;
              case TaskListKind.WithScopedModel:
                Navigator.of(context)
                    .pushReplacement(withScopedModel.createTaskListRoute());
                break;
            }
          },
        ),
      ],
    );

String _getTitle(TaskListKind kind) {
  switch (kind) {
    case TaskListKind.WithStatefulWidget:
      return 'with Stateful Widget';
    case TaskListKind.WithScopedModel:
      return 'with Scoped Model';
  }

  return 'Unknown';
}

enum TaskListKind {
  WithStatefulWidget,
  WithScopedModel,
}
