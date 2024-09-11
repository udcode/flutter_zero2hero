import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Example')),
        body: _getGridViewCount(),
      ),
    );
  }

  Widget _getGridViewCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.yellow),
      ],
    );
  }

  Widget _getGridViewBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          child: Center(child: Text('$index')),
        );
      },
    );
  }

  Widget _getGridViewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );
  }
}
