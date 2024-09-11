import 'package:flutter/material.dart';

void main() => runApp(StackApp());

class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack Example')),
        body: _getStackExample(),
      ),
    );
  }

  Widget _getStackExample() {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text('Bottom Right Text'),
        ),
      ],
    );
  }
}
