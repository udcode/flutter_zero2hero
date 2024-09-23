import 'package:flutter/material.dart';
import 'package:lecture_5/inheareted_widget/practice_task_manager.dart';

import 'practice_screen1.dart';
import 'task_manager.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TaskStateProviderPractice(
      child: MaterialApp(
        key: Key('TaskApp'),
        home: Page1Screen(),
      ),
    );
  }
}
