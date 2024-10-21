import 'dart:async';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


String currentFutureText = 'Future';


  @override
  void initState() {

      Future(() async{
        for(int i = 0; i < 100; i++) {
          setState(() {
            currentFutureText = 'Future $i';
          });
          await Future.delayed(Duration(milliseconds: 300));
        }
      });



      scheduleMicrotask(() async{
        for(int i = 0; i < 100; i++) {
          setState(() {
            currentFutureText = 'Microtask $i';
          });


          await Future.delayed(Duration(milliseconds: 2));
        }
    });



    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        currentFutureText = 'Post Frame Callback';
      });

    });



    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Heavy Computation Example')),
        body:Text(currentFutureText)
      ),
    );
  }
}