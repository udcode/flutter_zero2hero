import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('דוגמה ל-Expanded'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1, // יתפוס 1/3 מהגובה הזמין
                child: Container(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Expanded 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2, // יתפוס 2/3 מהגובה הזמין
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Expanded 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
