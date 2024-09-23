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
  void _receiveExternalEvent() async {
    // נווט למסך חדש וקבל תוצאה חזרה
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewMessageScreen()),
    );

    // אם התקבלו נתונים, עדכן את המסך הראשי
    if (result != null) {
      setState(() {
        _message = result;
      });
    }
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
              onPressed: _receiveExternalEvent,
              child: Text('קבל הודעה חדשה'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewMessageScreen extends StatelessWidget {
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
              'הודעה חדשה התקבלה!',
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
