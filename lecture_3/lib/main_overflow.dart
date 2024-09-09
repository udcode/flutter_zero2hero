import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            // Text('Hello World'),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SizedBox(
                          height: 300,
                          child: Text('Hello World')),),
                    Flexible(
                      child: Container(
                        height: 400,
                        color: Colors.blue,
                      ),
                    ),

                    Flexible(
                        flex: 1,
                        child: Text('Hello World')),
                    Flexible(child: Container(
                      height: 100,
                      color: Colors.blue,
                    ),),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                    color: Colors.red,
                  height:MediaQuery.of(context).size.height,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            height: 400,
                            color: Colors.grey,
                            width: double.infinity,
                            child: Text('lower part'),
                          ),
                        ),

                        Flexible(
                          child: Container(//will overflow
                            height: 500,
                            color: Colors.green,
                            child: Text('lower part'),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: MediaQuery(
                              data:MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
                              child: Row(
                                children: [
                                  Text('Hello World',style: TextStyle(fontSize: 20),),
                                  Text('Hello World'),
                                  Text('Hello World'),
                                  Text('Hello World'),
                                ],
                              ),
                            )),
                        Flexible(
                          child: SizedBox(
                              height: 300,
                              child: Text('Hello World')),
                        ),
                      ],
                    ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
