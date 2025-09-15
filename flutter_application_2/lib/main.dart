import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter burga',
      home: Scaffold(
        backgroundColor: Colors.green,
        body:Column(
          children: [
            //Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  color: Colors.lime
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  color: Colors.lime,
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BURGA"),
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.yellow,
                      margin: const EdgeInsets.all(10),
                    ),
                    Row(
                      children: [
                      CircleAvatar(radius: 5, backgroundColor: Colors.amber),
                      CircleAvatar(radius: 5, backgroundColor: Colors.amber),
                      CircleAvatar(radius: 5, backgroundColor: Colors.amber),
                    ],),
                    Text("PICK IT UP AND SWALLOW IT WHOLE")
                  ])
            ],)
          ]
        )
      )
    );
  }
}
