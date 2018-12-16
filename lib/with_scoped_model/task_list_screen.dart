import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fluttask/task_list.dart';
import 'package:fluttask/new_task_floating_action_button.dart';
import 'package:fluttask/with_scoped_model/task_list_model.dart';
import 'package:fluttask/task_list_route_app_bar.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<TaskListModel>(
        builder: (context, child, model) => Scaffold(
              appBar: buildTaskListScreenAppBar(
                context,
                TaskListKind.WithScopedModel,
              ),
              body: TaskList(
                tasks: model.tasks,
                onFinishTask: model.finishTask,
                onUnfinishTask: model.unfinishTask,
                onDeleteTask: model.deleteTask,
              ),
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
                  NewTaskFloatingActionButton(onAddNewTask: model.addTask),
            ),
      );
}
