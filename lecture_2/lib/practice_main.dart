import 'package:flutter/material.dart';

/// write flutter entry point main
void main() {
  runApp(MyApp());
}

/// MyApp is a StatelessWidget that returns a MaterialApp
/// with a title and a home Scaffold
/// The Scaffold has an AppBar and a SingleChildScrollView
/// with a Column as a child

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
              SizedBox(height: 100, width: 100), // SizedBox for spacing

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
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text Widget
                    Text(
                      'Hello, Flutter!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}