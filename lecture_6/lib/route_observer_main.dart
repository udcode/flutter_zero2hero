import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyRouteObserver extends RouteObserver<ModalRoute> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
   print('comming from $previousRoute and going to $route');

  }
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('going back from $route to $previousRoute');
  }
  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    print('didRemove');
  }
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute:newRoute, oldRoute:oldRoute);
    print('didReplace');
  }
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    print('didStartUserGesture');
  }
  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    print('didStopUserGesture');
  }
}
// יצירת מחלקת RouteObserver למעקב אחרי שינויים במסכים
final RouteObserver<ModalRoute> routeObserver = MyRouteObserver();

final RouteObserver<ModalRoute> dataDogRouteObserver = DatadogLoggerObserver();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      navigatorObservers: [routeObserver,dataDogRouteObserver], // הוספת RouteObserver לאפליקציה
    );
  }
}
//create a singleton class





class DatadogMockLogger {
  //singleton
  static final  DatadogMockLogger _instance = DatadogMockLogger._internal();

   DatadogMockLogger._internal() ;
   factory DatadogMockLogger() => _instance;



  void log(String message) {
    print("DatadogMockLogger: $message");
  }
}


//datadog logger observer
class DatadogLoggerObserver extends RouteObserver<ModalRoute> {
  @override
  void didPush(Route route, Route? previousRoute) {
    DatadogMockLogger._instance.log("didPush: ${route.settings.name}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    DatadogMockLogger._instance.log("didPop: ${route.settings.name}");
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    DatadogMockLogger._instance.log("didRemove: ${route.settings.name}");
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    DatadogMockLogger._instance.log("didReplace: ${newRoute!.settings.name}");
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    DatadogMockLogger._instance.log("didStartUserGesture: ${route.settings.name}");
  }

  @override
  void didStopUserGesture() {
    DatadogMockLogger._instance.log("didStopUserGesture");
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: 'VideoScreen'),
                  builder: (context) => VideoScreen()),
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
      appBar: AppBar(title: Text("1")),
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
                MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(),body: Center(child: Column(
                  children: [
                    Text("2"),
                    ElevatedButton(
                      onPressed: () {
                       //push to text screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(
                            leading: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.popUntil(context, ModalRoute.withName('VideoScreen'));
                              },
                            ),
                          ),body: Center(child: Column(
                            children: [
                              Text("3"),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.popUntil(context, ModalRoute.withName('VideoScreen'));
                                },
                                child: Text("Go back"),
                              ),
                            ],
                          )))),
                        );
                      },
                      child: Text("Go to Text Screen"),
                    ),
                  ],
                )))),
              );
            },
            child: Text("Go to Audio Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Alert Dialog"),
                    content: Text("This is an alert dialog"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("show dialog"),
          ),
        ],
      ),
    );
  }
}
