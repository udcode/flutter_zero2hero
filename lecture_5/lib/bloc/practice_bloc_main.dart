import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_5/bloc/practice_form_list_screen.dart';
import 'bloc/task_bloc.dart';
import 'form_bloc/form_bloc.dart';
import 'task_list_screen.dart';


void main() {
  runApp(FormApp());
}
var formCubit = FormCubit();
class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<FormCubit>.value(
      value:formCubit ,

        child:  MaterialApp(
            key: Key('TaskApp'),
            home: FormListScreen(),



    ));
  }
}