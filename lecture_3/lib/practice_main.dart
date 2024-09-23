import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OverFlow(),
    );
  }
}

class OverFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 600,
            width: double.infinity,
          ),
          Container(
            color: Colors.yellow,
            height: 200,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Hello and welcome to the world of flutter'),
                        Text('Hello and more text'),
                        Text('Hello', maxLines: 1),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(child: Icon(Icons.ac_unit)),
                      Flexible(child: Text('Hello and welcome')),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
