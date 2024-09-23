import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:lecture_5/inheareted_widget/practice_task_state.dart';
import '../task.dart';
import 'task_state.dart';

class TaskStateProviderPractice extends StatefulWidget {
  final Widget child;

  TaskStateProviderPractice({required this.child});

  @override
  _TaskStateProviderPractice createState() => _TaskStateProviderPractice();
}

class _TaskStateProviderPractice extends State<TaskStateProviderPractice> {
  List<Task> _tasks = [];
  String _text = 'Initial Text';

  void _changeText() {
    setState(() {
      _text = Random().nextInt(100).toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskState2(
      textPage1: _text,
      changeText: _changeText,
      child: widget.child,
    );
  }
}
