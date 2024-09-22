import 'package:flutter/material.dart';

import 'add_task_screen.dart';
import 'task_state.dart';

class TaskListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final taskState = TaskState.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: ListView.builder(
        itemCount: taskState!.tasks.length,
        itemBuilder: (context, index) {
          final task = taskState.tasks[index];
          return ListTile(
            title: Text(task.title,
                style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                )),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (_) {
                taskState.toggleTask(index);
              },
            ),
            onLongPress: () => taskState.removeTask(index),
          );
        },
      ),
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
