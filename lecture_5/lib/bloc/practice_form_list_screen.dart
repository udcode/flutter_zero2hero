import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_5/bloc/practice_add_form_screen.dart';
import 'add_task_screen.dart';
import 'bloc/task_bloc.dart';
import 'form_bloc/form_bloc.dart';

class FormListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form List')),
      body: BlocBuilder<FormCubit, FormsState>(
        bloc:  BlocProvider.of<FormCubit>(context),
        buildWhen: (previous, current) {
          //todo change it to form
          return  current is FormLoadingState || previous is FormLoadingState ||  current is FormLoadedState && previous is FormInitialState || current is FormLoadedState && previous is FormLoadedState &&   (current as FormLoadedState).forms.length != (previous as FormLoadedState).forms.length;
        },
        builder: (context, state) {
          if (state is FormLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FormLoadedState) {
            return ListView.builder(
              itemCount: state.forms.length,
              itemBuilder: (context, index) {
                final task = state.forms[index];
                return ListTile(
                  title: Text('Name: ${task.name}'),
                  subtitle: Text('Email: ${task.email}'),
                  trailing: Text('Age: ${task.age}'),
                  onLongPress: () {
                    BlocProvider.of<TaskCubit>(context).removeTask(index);
                  },
                );
              },
            );
          } else if (state is FormErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No tasks yet!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddFormScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}