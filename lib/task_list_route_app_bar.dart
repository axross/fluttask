import 'package:flutter/material.dart';
import 'package:fluttask/with_bloc/task_list_route.dart' as withBloc;
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
                PopupMenuItem(
                  value: TaskListKind.WithBloc,
                  child: Text('with BLoC'),
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
              case TaskListKind.WithBloc:
                Navigator.of(context)
                    .pushReplacement(withBloc.createTaskListRoute());
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
    case TaskListKind.WithBloc:
      return 'with BLoC pattern';
  }

  return 'Unknown';
}

enum TaskListKind {
  WithStatefulWidget,
  WithScopedModel,
  WithBloc,
}
