import 'package:flutter/material.dart';

import 'task_list_screen.dart';
import 'task_manager.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TaskStateProvider(
      child: MaterialApp(
        key: Key('TaskApp'),
        home: TaskListScreen(),
      ),
    );
  }
}
