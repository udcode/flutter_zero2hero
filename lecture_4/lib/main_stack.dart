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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 300,color: Colors.green,),
        Flexible(
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text('Bottom Right Text'),
              ),
              Positioned(
                height: 300,
                width: 300,
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.blue,
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 100,
                  height: 100,

                  child: Card(
                      color: Colors.blue,
                      child: Text('Bottom Right Text')),
                ),
              ),
              Positioned(
                top: -10,
                left: 30,
                height: 30,
                width: 30,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  child: Placeholder(),
                ),),
            ],
          ),
        ),
      ],
    );
  }
}
