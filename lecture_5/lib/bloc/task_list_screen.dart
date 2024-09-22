import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_task_screen.dart';
import 'bloc/task_bloc.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: BlocBuilder<TaskCubit, TaskState>(
        bloc:  BlocProvider.of<TaskCubit>(context),
        buildWhen: (previous, current) {

          return  current is TaskLoadingState || previous is TaskLoadingState ||  current is TaskLoadedState && previous is TaskInitialState || current is TaskLoadedState && previous is TaskLoadedState &&   (current as TaskLoadedState).tasks.length != (previous as TaskLoadedState).tasks.length;
        },
        builder: (context, state) {
          if (state is TaskLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TaskLoadedState) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.title,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      )),
                  trailing: BlocBuilder<TaskCubit, TaskState>(
                      bloc:  BlocProvider.of<TaskCubit>(context),
                      buildWhen: (previous, current) {
                        return current is TaskLoadedState && previous is TaskLoadedState &&   (current as TaskLoadedState).tasks[index].isCompleted != (previous as TaskLoadedState).tasks[index].isCompleted;
                      },
                    builder: (context, state) {
                      return Checkbox(
                        value: (state as TaskLoadedState).tasks[index].isCompleted,
                        onChanged: (_) {
                          BlocProvider.of<TaskCubit>(context).toggleTask(index);
                        },
                      );
                    }
                  ),
                  onLongPress: () {
                    BlocProvider.of<TaskCubit>(context).removeTask(index);
                  },
                );
              },
            );
          } else if (state is TaskErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No tasks yet!'));
          }
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