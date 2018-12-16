import 'package:flutter/material.dart';
import 'package:fluttask/with_bloc/task_list_screen.dart';

Route createTaskListRoute() =>
    MaterialPageRoute(builder: (context) => TaskListScreen());
