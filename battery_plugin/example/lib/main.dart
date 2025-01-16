import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:battery_plugin/battery_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _platformVersion = -1;
  final _batteryPlugin = BatteryPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    int? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _batteryPlugin.getBatteryLevel() ?? -1;
    } on PlatformException {
      platformVersion = -1;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion??-1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var stream = _batteryPlugin.getBatteryLevelStream().listen((event) {
      print('Battery Level: ${event!['percentage']}');
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [

            StreamBuilder<Map?>(
              stream: _batteryPlugin.getBatteryLevelStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Battery Level: ${snapshot.data!['percentage']}');
                } else {
                  return Text('Battery Level: unknown');
                }
              },
            ),

            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
          ],
        ),

      ),
    );
  }
}
