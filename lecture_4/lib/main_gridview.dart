import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Example')),
        body: _getGridViewExtent(),
      ),
    );
  }

  Widget _getGridViewCount() {
    return GridView.count(
scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      crossAxisSpacing: 30,
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
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:6,
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
      maxCrossAxisExtent: 300,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );
  }
}
