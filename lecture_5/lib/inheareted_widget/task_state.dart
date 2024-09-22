import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../task.dart';

class TaskState extends InheritedWidget {
  final List<Task> tasks;
  final Function addTask;
  final Function toggleTask;
  final Function removeTask;

  TaskState({
    Key? key,
    required this.tasks,
    required this.addTask,
    required this.toggleTask,
    required this.removeTask,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(TaskState oldWidget) {

    var isChanged = !listEquals(oldWidget.tasks, tasks);
    return isChanged;
  }

  static TaskState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskState>();
  }
}
