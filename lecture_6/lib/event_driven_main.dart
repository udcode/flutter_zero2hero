import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _message = 'אין הודעות חדשות';

  // פונקציה לדמות קבלת הודעת Push או אירוע חיצוני
  void _sendExternalEvent() async {
    var randomMessage = 'הודעה חדשה מספר ${DateTime.now().second}';
  _messageStreamController.add(randomMessage);
  randomMessage = 'הודעה חדשה מספר ${DateTime.now().second +1} ';
  _messageStreamController.add(randomMessage);
  }


  StreamController<String> _messageStreamController = StreamController<String>.broadcast();


  @override
  void dispose() {
    _messageStreamController.close();
    super.dispose();
  }

  @override
  void initState() {
    _messageStreamController.stream.listen((String message) async{
      // נווט למסך חדש וקבל תוצאה חזרה

      print('recieved message $message');

      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewMessageScreen(
          message: message,
        )),
      );

      // אם התקבלו נתונים, עדכן את המסך הראשי
      if (result != null) {
        setState(() {
          _message = result;
        });
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('מסך ראשי'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'הודעה אחרונה: $_message',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendExternalEvent,
              child: Text('קבל הודעה חדשה'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewMessageScreen extends StatelessWidget {

  final String message;

  NewMessageScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('הודעה חדשה'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // חזור למסך הראשי עם הודעה
                Navigator.pop(context, 'הודעה חדשה נפתחה!');
              },
              child: Text('חזור עם הודעה'),
            ),
          ],
        ),
      ),
    );
  }
}
