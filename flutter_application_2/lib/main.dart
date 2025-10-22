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
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.all(10),
                  color: Colors.lime
                ),
                Container(
                  width: 70,
                  height: 70,
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
                      width: 250,
                      height: 250,
                      color: Colors.yellow,
                      margin: const EdgeInsets.all(10),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvmHYA_Vdxrjr6_n40SJqkYe3wipAG9-0mbQ&s"),
                    ),
                    Row(
                      children: [
                      CircleAvatar(radius: 5, backgroundColor: Colors.amber),
                      CircleAvatar(radius: 5, backgroundColor: Colors.amber),
                      CircleAvatar(radius: 5, backgroundColor: Colors.amberAccent),
                    ],),
                    Text("PICK IT UP")
                  ])
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      height: 50,
                      child: RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(text:"550 CAL.\n",style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)),
                          TextSpan(text:"Calories",style: TextStyle(color: Colors.amberAccent))
                        ]
                      ) 
                    ),),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      height: 50,
                      child: RichText(
                        text:TextSpan(
                          children: [
                            TextSpan(text:"30G\n",style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)),
                            TextSpan(text:"Total Fat\n",style: TextStyle(color: Colors.amberAccent)),
                            TextSpan(text:"(38% DV)",style: TextStyle(color: Colors.amberAccent))
                          ]
                        ) 
                    ),)
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      height: 50,
                      child: RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(text:"45G\n",style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)),
                          TextSpan(text:"Total Carbs\n",style: TextStyle(color: Colors.amberAccent)),
                          TextSpan(text:"(16% DV)",style: TextStyle(color: Colors.amberAccent))
                        ]
                      ) 
                    ),),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      height: 50,
                      child: RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(text:"25G\n",style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)),
                          TextSpan(text:"Protein",style: TextStyle(color: Colors.amberAccent))
                        ]
                      ) 
                    ),)
                  ],)
                ],),
                Container(
                  width: 20,
                  child: RotatedBox(
                    quarterTurns: 3, 
                    child: Text('CALCULATOR',style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ],
            )
          ]
        )
      )
    );
  }
}
