import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
void backgroundWorker(Map<String,dynamic> args) async{
  var sendPort = args['port'] as SendPort;
 var receivePort = ReceivePort();
  var delay = args['delay'] as int;
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    delay = message as int;
  });

 while (true) {
   await Future.delayed(Duration(seconds: delay));
   var random = DateTime.now().second;
   sendPort.send('Hello from Isolate $random');
 }

}

SendPort? sendPort;
void main() {

  runApp(MyApp());
}


Completer<bool> isolateReady = Completer<bool>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Heavy Computation Example')),
        body: HomePageWorker(),
      ),
    );
  }
}



class HomePageWorker extends StatefulWidget {
  const HomePageWorker({super.key});

  @override
  State<HomePageWorker> createState() => _HomePageWorkerState();
}

class _HomePageWorkerState extends State<HomePageWorker> {


  @override
  void initState() {
    ReceivePort receivePort = ReceivePort();
    var args = {'port':receivePort.sendPort, 'delay':1};

    receivePort.listen((message) {
      if(message is SendPort) {
        sendPort = message;
        isolateReady.complete(true);
      } else {
        print(message);
       setState(() {
         messageFromIsolate = message as String;
       });
      }
    });
    Isolate.spawn(backgroundWorker, args);
    super.initState();
  }

  String messageFromIsolate = 'No message yet';
StreamController<int> delayStream = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Worker Example')),
      body: FutureBuilder<bool>(
        future: isolateReady.future,
        builder: (context,state) {
          if(state.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  sendPort?.send(5);
                },
                child: Text('Change Delay to 5 seconds'),
              ),
              ElevatedButton(
                onPressed: () {
                  sendPort?.send(1);
                },
                child: Text('Change Delay to 1 second'),
              ),
              Text(messageFromIsolate),
            ],


          );
        }
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = 'Press the button to start computation';

  // פונקציה שמבצעת חישוב כבד מאוד ב-Thread הראשי
  void performHeavyComputation() {
    setState(() {
      result = 'Computing...';
    });

    // חישוב כבד
    int sum = 0;
    for (int i = 0; i < 1000000000; i++) {
      sum += i;
    }

    setState(() {
      result = 'Computation finished. Sum: $sum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(result, textAlign: TextAlign.center),
        if(result == 'Computing...')CircularProgressIndicator(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            performHeavyComputation(); // מבצע את החישוב הכבד
          },
          child: Text('Start Heavy Computation'),
        ),
      ],
    );
  }
}
class MyHomePageIsolate extends StatefulWidget {
  @override
  _MyHomePageIsolateState createState() => _MyHomePageIsolateState();
}

class _MyHomePageIsolateState extends State<MyHomePageIsolate> {
  String result = 'Press the button to start computation';

  // פונקציה שמבצעת חישוב כבד ב-Isolate נפרד
  void performHeavyComputationInIsolate() async {
    setState(() {
      result = 'Computing...';
    });

    // יצירת ReceivePort לקבלת תוצאות מ-Isolate
    final receivePort = ReceivePort();

    // יצירת Isolate חדש לביצוע החישוב
    Map<String,dynamic> args  ={'port':receivePort.sendPort, 'total':1000};
    await Isolate.spawn(_heavyComputation,args );

    // קבלת התוצאה מ-Isolate
    receivePort.listen((data) {
      setState(() {
        result = 'Computation finished. Sum: $data';
      });
    });
  }

  // פונקציה שרצה ב-Isolate ומבצעת את החישוב הכבד
  static void _heavyComputation(Map<String,dynamic> args) {
    int sum = 0;
    final sendPort = args['port'] as SendPort;
    final total = args['total'] as int;
    for (int i = 0; i < total; i++) {
      sum += i;
    }
    sendPort.send(sum); // שליחת התוצאה ל-Thread הראשי
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(result, textAlign: TextAlign.center),
        if(result == 'Computing...')CircularProgressIndicator(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            performHeavyComputationInIsolate(); // מבצע את החישוב הכבד ב-Isolate
          },
          child: Text('Start Heavy Computation'),
        ),
      ],
    );
  }
}