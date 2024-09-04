import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
  debugRepaintRainbowEnabled = true; // Enables the repaint visualization

  WidgetsApp.debugAllowBannerOverride = false; // Removes debug banner
  debugPaintLayerBordersEnabled = true; // Visualize layer boundaries
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RepaintBoundary asdf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageGridScreen(),
    );
  }
}

class ImageGridScreen extends StatefulWidget {
  @override
  _ImageGridScreenState createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<ImageGridScreen> {
  String text = "Hello";

  @override
  void initState() {
    super.initState();
    // מחליפים את הטקסט כל שנייה
    Future.delayed(Duration.zero, () {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          text = text == "Hello" ? "World" : "Hello";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepaintBoundary sdfsdf'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 32),
              ),
            ),
            Column(
              children: [
                // תמונה רגילה
                ...List.generate(
                    30,
                    (index) => Image.network(
                        'https://picsum.photos/200?random=$index')).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
