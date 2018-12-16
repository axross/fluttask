import 'dart:async';
import 'package:fluttask/task.dart';

class Tasks {
  List<Task> _tasks = [
    Task(title: 'Create a new flutter app', createdAt: DateTime.now()),
    Task(
        title: 'Edit code',
        createdAt: DateTime.now().add(Duration(seconds: 1)),
        finishedAt: DateTime.now().add(Duration(seconds: 100))),
    Task(
        title: 'Run the app on emulators',
        createdAt: DateTime.now().add(Duration(seconds: 2))),
  ];

  final StreamController<Task> _$addition = StreamController<Task>();
  final StreamController<Task> _$deletion = StreamController<Task>();
  final StreamController<Task> _$finishing = StreamController<Task>();
  final StreamController<Task> _$unfinishing = StreamController<Task>();

  final StreamController<List<Task>> _$tasks =
      StreamController<List<Task>>.broadcast();

  Tasks() {
    _$addition.stream.listen((task) {
      _tasks.add(task);

      _$tasks.add(_tasks);
    });

    _$deletion.stream.listen((task) {
      _tasks.remove(task);

      _$tasks.add(_tasks);
    });

    _$finishing.stream.listen((task) {
      _tasks[_tasks.indexOf(task)] = task.finish();

      _$tasks.add(_tasks);
    });

    _$unfinishing.stream.listen((task) {
      _tasks[_tasks.indexOf(task)] = task.unfinish();

      _$tasks.add(_tasks);
    });
  }

  Sink<Task> get addition => _$addition.sink;
  Sink<Task> get deletion => _$deletion.sink;
  Sink<Task> get finishing => _$finishing.sink;
  Sink<Task> get unfinishing => _$unfinishing.sink;

  Stream<List<Task>> get tasksStream => _$tasks.stream;

  List<Task> get tasks => _tasks;

  void dispose() {
    _$addition.close();
    _$deletion.close();
    _$finishing.close();
    _$unfinishing.close();
  }
}
