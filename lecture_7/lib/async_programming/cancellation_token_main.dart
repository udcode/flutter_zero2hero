import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:async/async.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}
StreamController<int> streamController = StreamController<int>.broadcast();
class _AppState extends State<App> {
  // make sure you don't initiate your router
  CancelableOperation? cancelableOperation;

  @override
  Widget build(BuildContext context) {
   //pause the stream

    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cancelation Token'),
          ),
          body: Center(
              child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  EasyLoading.show(status: 'loading...');
                  cancelableOperation = CancelableOperation.fromFuture(
                    Future.delayed(Duration(seconds: 10)),
                    onCancel: () {
                      EasyLoading.dismiss();
                      print('Operation Canceled');
                    },
                  )..value.then((value) {
                      EasyLoading.dismiss();
                      print('Operation Finished successfully');
                    });
                },
                child: Text('Start Cancelable Operation'),
              ),
              ElevatedButton(
                onPressed: () {
                  cancelableOperation?.cancel();
                },
                child: Text('Cancel Operation'),
              ),
              //comlete the completer button
              ElevatedButton(
                onPressed: () {
                  // completer.complete('Hello World');
                  completer.completeError('An error occurred');
                },
                child: Text('Complete Completer'),
              ),
              FutureBuilder<String>(
                future: completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data: ${snapshot.data}');
                  }
                },
              ),
              FutureBuilder<String>(
                future: completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data2: ${snapshot.data}');
                  }
                },
              ),
              StreamBuilder<String>(
                stream: myStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data: ${snapshot.data}');
                  }
                },
              ),
              StreamBuilder<String>(
                stream: myStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Data2: ${snapshot.data}');
                  }
                },
              ),



              //add data to the stream button
              ElevatedButton(
                onPressed: () {
                  var randomNumber = DateTime.now().second;
                  streamController.add('Hello World $randomNumber');
                },
                child: Text('Add Data to Stream'),
              ),
            ],

            //future builder that listen to the completer
          ))),
    );
  }
  final Stream<String> myStream = streamController.stream.asBroadcastStream();
}

Completer<String> completer = Completer<String>();


StreamController<String> streamController = StreamController<String>();
