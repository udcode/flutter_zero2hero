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
  String result = "No result yet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Result from Details Screen: $result"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Navigator.push() מעביר את הנתונים למסך הפרטים ומחזיר תוצאה.
              final returnedResult = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(data: "Hello from Home Screen"),
                ),
              );
              // החזרת התוצאה למסך הראשי
              if (returnedResult != null) {
                setState(() {
                  result = returnedResult;
                });
              }
            },
            child: Text("Go to Details Screen"),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String data;

  DetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Data from Home Screen: $data"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop() מחזיר תוצאה למסך הראשי.
              Navigator.pop(context, "Result from Details Screen");
            },
            child: Text("Return to Home Screen with Result"),
          ),
        ],
      ),
    );
  }
}
