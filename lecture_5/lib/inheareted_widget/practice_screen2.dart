import 'package:flutter/material.dart';
import 'package:lecture_5/inheareted_widget/practice_task_state.dart';

import 'add_task_screen.dart';
import 'task_state.dart';

class Page2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final taskState = TaskState2.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Page2')),
      body: Center(child: Text('${taskState?.textPage1}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTaskScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
