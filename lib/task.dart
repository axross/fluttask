import 'package:meta/meta.dart';

@immutable
class Task {
  final String title;
  final DateTime createdAt;
  final DateTime finishedAt;

  Task({
    @required this.title,
    @required this.createdAt,
    this.finishedAt,
  })  : assert(title != null),
        assert(createdAt != null);

  get isFinished => finishedAt != null;

  Task finish({DateTime finishedAt}) => Task(
        title: title,
        createdAt: createdAt,
        finishedAt: finishedAt == null ? DateTime.now() : finishedAt,
      );

  Task unfinish() => Task(
        title: title,
        createdAt: createdAt,
      );

  @override
  int get hashCode => (17 + title.hashCode) * 37 + createdAt.hashCode;

  @override
  bool operator ==(Object task) =>
      task is Task && title == task.title && createdAt == task.createdAt;
}
