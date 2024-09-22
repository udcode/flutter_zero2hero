
part of 'task_bloc.dart';
abstract class TaskState {}

class TaskInitialState extends TaskState {}

class TaskLoadingState extends TaskState {}

class TaskLoadedState extends TaskState {
  final List<Task> tasks;
  TaskLoadedState(this.tasks);


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskLoadedState &&
      listEquals(other.tasks, tasks);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => tasks.hashCode;

}

class TaskErrorState extends TaskState {
  final String message;
  TaskErrorState(this.message);
}
