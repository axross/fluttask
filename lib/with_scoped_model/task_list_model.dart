import 'package:scoped_model/scoped_model.dart';
import 'package:fluttask/task.dart';

class TaskListModel extends Model {
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

  get tasks => _tasks;

  void finishTask(Task task) {
    _tasks[_tasks.indexOf(task)] = task.finish();

    notifyListeners();
  }

  void unfinishTask(Task task) {
    _tasks[_tasks.indexOf(task)] = task.unfinish();

    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);

    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);

    notifyListeners();
  }
}
