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
          title: Text('תרגול עם Containr והגבלות'),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300,  // רוחב מקסימלי של 300 פיקסלים
              // minHeight: 650, // גובה מינימלי של 150 פיקסלים
            ),
            child: Container(
              color: Colors.blue, // צבע רקע לכחול להמחשה

              child: Text(
                'זהו Container עם הגבלות!',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
