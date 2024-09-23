import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../FormObj.dart';
part 'form_state.dart';
class FormCubit extends Cubit<FormsState> {
  List<FormObj> _forms = [];

  FormCubit() : super(FormInitialState());
Stream<int> get taskCount async* {
    yield _forms.length;
  }
  void addForm(FormObj form) {

    _forms = [..._forms, form];
    var currentState = state;
    var mystate = FormLoadedState(_forms);
    emit(mystate);
  }

  // void removeTask(int index) async{
  //   emit(TaskLoadingState());
  //  await Future.delayed(Duration(seconds: 2));
  //   _tasks = _tasks.toList()..removeAt(index);
  //   emit(TaskLoadedState(_tasks));
  // }
  //
  // void toggleTask(int index) {
  //
  //   _tasks = _tasks.map((task) {
  //     if (_tasks.indexOf(task) == index) {
  //       return task.copyWith(isCompleted: !task.isCompleted);
  //     }
  //     return task;
  //   }).toList();
  //   emit(TaskLoadedState(_tasks));
  // }


  @override
  Future<void> close() async{
    print('FormCubit is closed');
    super.close();
  }
}
