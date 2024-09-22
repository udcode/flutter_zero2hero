import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// יצירת מחלקת RouteObserver למעקב אחרי שינויים במסכים
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      navigatorObservers: [routeObserver], // הוספת RouteObserver לאפליקציה
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoScreen()),
            );
          },
          child: Text("Go to Video Screen"),
        ),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> with RouteAware {
  bool isPlaying = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!); // הרשמה ל-RouteObserver
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this); // הסרת הרשמה כאשר המסך נסגר
    super.dispose();
  }

  @override
  void didPopNext() {
    // כאשר משתמש חוזר למסך הווידאו

    print("returning to video screen");
    setState(() {
      isPlaying = true; // חידוש הווידאו
    });
  }

  @override
  void didPushNext() {
    // כאשר משתמש עוזב את המסך
    print("leaving video screen");
    setState(() {
      isPlaying = false; // עצירת הווידאו
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Screen")),
      body: Column(
        children: [
          Center(
            child: Text(isPlaying ? "Playing Video" : "Video Paused"),
          ),
          //go to next screen
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(),body: Center(child: Text("Audio Screen")))),
              );
            },
            child: Text("Go to Audio Screen"),
          ),
        ],
      ),
    );
  }
}
