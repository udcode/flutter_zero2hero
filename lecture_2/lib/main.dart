import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Widgets Demo'),
        ),
        body: SingleChildScrollView(

          child: Column(
            children: [

              // Text Widget
              Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height:100,width: 100,), // SizedBox for spacing

              // Container with styling
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(-10, 2),
                    ),
                  ],
                ),
                child: Text(
                  'This is a styled Container',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              // Row with multiple children
              SizedBox(
                height: 200,
                width:400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(CupertinoIcons.star, color: Colors.red),
                    Icon(Icons.star, color: Colors.blue),
                    Icon(Icons.star, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 20), // SizedBox for spacing

              // Another Container with a Column inside
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Column inside a Container',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 20), // SizedBox for spacing
                    Text(
                      'This is a second line of text',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // SizedBox for spacing
              ...List.generate(20, (index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Container $index',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}