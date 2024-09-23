import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_bloc/form_bloc.dart';
import 'FormObj.dart';

class AddFormScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _ageController.text.isNotEmpty && _emailController.text.isNotEmpty) {
                  BlocProvider.of<FormCubit>(context).addForm(FormObj(name: _nameController.text, age: _ageController.text, email: _emailController.text));
                  Navigator.pop(context);
                }
              },
              child: Text('Add Form'),
            ),
          ],
        ),
      ),
    );
  }
}