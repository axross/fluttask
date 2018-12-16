import 'package:flutter/widgets.dart';
import 'package:fluttask/with_bloc/tasks_provider.dart';
import 'package:fluttask/with_bloc/tasks.dart';

class TasksConsumer extends StatelessWidget {
  final ConsumerBuilder builder;

  TasksConsumer({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = TasksProvider.of(context);

    return builder(context, tasks);
  }
}

typedef Widget ConsumerBuilder(BuildContext context, Tasks tasks);
