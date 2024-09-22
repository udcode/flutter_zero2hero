import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lecture_5/task.dart';
part 'task_state.dart';
class TaskCubit extends Cubit<TaskState> {
  List<Task> _tasks = [];

  TaskCubit() : super(TaskInitialState());
Stream<int> get taskCount async* {
    yield _tasks.length;
  }
  void addTask(String title) {

    _tasks = [..._tasks, Task(title: title, isCompleted: false)];
    var currentState = state;
    var mystate = TaskLoadedState(_tasks);
    emit(mystate);
  }

  void removeTask(int index) async{
    emit(TaskLoadingState());
   await Future.delayed(Duration(seconds: 2));
    _tasks = _tasks.toList()..removeAt(index);
    emit(TaskLoadedState(_tasks));
  }

  void toggleTask(int index) {

    _tasks = _tasks.map((task) {
      if (_tasks.indexOf(task) == index) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    emit(TaskLoadedState(_tasks));
  }


  @override
  Future<void> close() async{
    print('TaskCubit is closed');
    super.close();
  }
}
