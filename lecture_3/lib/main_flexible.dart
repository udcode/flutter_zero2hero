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
          title: Text('דוגמה ל-Flexible'),
        ),
        body: Center(
          child: Row(
            children: [
              Flexible(
                flex: 2, // רכיב זה יתפוס פי 2 יותר מקום מהרכיב השני
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Flexible 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1, // רכיב זה יתפוס חצי מהגודל של הרכיב הראשון
                child: Container(
                  color: Colors.green,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Flexible 2',
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
