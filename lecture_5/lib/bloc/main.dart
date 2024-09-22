import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/task_bloc.dart';
import 'task_list_screen.dart';


void main() {
  runApp(TaskApp());
}
var taskCubit = TaskCubit();
class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<TaskCubit>.value(
      value:taskCubit ,

        child:  MaterialApp(
            key: Key('TaskApp'),
            home: TaskListScreen(),



    ));
  }
}