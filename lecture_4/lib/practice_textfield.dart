import 'package:flutter/material.dart';

import 'main_listview.dart';

void main() => runApp(StackApp());

class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField Example')),
        body: _getMyForm(),
      ),
    );
  }

  Widget _getTextField() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your username',
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: PasswordField(),
        ),
      ],
    );
  }

  Widget _getMyForm() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: MyForm(),
    );
  }

}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your username',
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your email',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your phone number',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your phone number';
              }
              if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          const PasswordField(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Process data
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }
}

// class PasswordField extends StatefulWidget {
//   const PasswordField({Key? key}) : super(key: key);
//
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: 'Enter your password',
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: IconButton(
//           icon: Icon(
//             _obscureText ? Icons.visibility : Icons.visibility_off,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//         ),
//       ),
//       keyboardType: TextInputType.visiblePassword,
//       obscureText: _obscureText,
//     );
//   }
// }
