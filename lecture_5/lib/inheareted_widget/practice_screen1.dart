import 'package:flutter/material.dart';
import 'package:lecture_5/inheareted_widget/practice_screen2.dart';
import 'package:lecture_5/inheareted_widget/practice_task_state.dart';

import 'task_state.dart';

class Page1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final taskState = TaskState2.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Column(
        children: [
          Center(child: Text('Page1')),
          ElevatedButton(
            onPressed: () {
              taskState?.changeText();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Page2Screen()),
              // );
            },
            child: Text('${taskState?.textPage1}'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page2Screen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
