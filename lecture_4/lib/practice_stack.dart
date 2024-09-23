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
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          width: 300,
          height: 300,
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ],
    );
  }
}
