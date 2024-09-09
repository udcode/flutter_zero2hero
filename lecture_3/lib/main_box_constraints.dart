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
              minHeight: 100, // גובה מינימלי של 650 פיקסלים
              maxHeight: 120,
            ),
            child: Container(
              color: Colors.blue, // צבע רקע לכחול להמחשה

              child: Text(
                '''
                adflajsjkasdfas
                alsdfjaksdjf
                alsdfjalkjf
                asdlkjasldfj
                asldjkaslfj
                asdlkjasldfajsdf
                alsdfjalsdfj
                alsdjkasdf
                lasdfj
                
                ''',

                overflow: TextOverflow.ellipsis,
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
