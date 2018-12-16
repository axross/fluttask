import 'package:flutter/widgets.dart';
import 'package:fluttask/with_bloc/tasks.dart';

class TasksProvider extends InheritedWidget {
  final Tasks tasks;

  TasksProvider({Key key, @required this.tasks, @required Widget child})
      : assert(tasks != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget _) => true;

  static Tasks of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(TasksProvider) as TasksProvider)
          .tasks;
}
