import 'package:flutter/cupertino.dart';
import '../task.dart';
import 'task_state.dart';

class TaskStateProvider extends StatefulWidget {
  final Widget child;

  TaskStateProvider({required this.child});

  @override
  _TaskStateProviderState createState() => _TaskStateProviderState();
}

class _TaskStateProviderState extends State<TaskStateProvider> {
  List<Task> _tasks = [];

  void _addTask(String title) {
    setState(() {
      _tasks = [..._tasks, Task(title: title, isCompleted: false)];

    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks = _tasks.map((task) {
        if (_tasks.indexOf(task) == index) {
          return task.copyWith(isCompleted: !task.isCompleted);
        }
        return task;
      }).toList();
    });
  }

  void _removeTask(int index) {
    setState(() {

       _tasks = _tasks.toList()..removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskState(
      tasks: _tasks,
      addTask: _addTask,
      toggleTask: _toggleTask,
      removeTask: _removeTask,
      child: widget.child,
    );
  }
}
