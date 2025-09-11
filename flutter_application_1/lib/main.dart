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
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 180, 231, 182),
        // the floating btn
        floatingActionButton: FloatingActionButton(onPressed: (){}, backgroundColor: Colors.amber, elevation: 12, child: Text("тык")),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Column(
          children: [
            // Header
            Container(
              color: Colors.lightGreenAccent,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Text("hi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center)
            ),
            // Main
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // photo
                    Container(
                      margin: const EdgeInsets.all(82),
                      padding: const EdgeInsets.all(30),
                      color: const Color.fromARGB(255, 180, 231, 182),
                      width: 300,
                      height: 250,
                      child: Image.network("https://images.techinsider.ru/upload/img_cache/35e/35ed71db9804413d9cc38259cff62cf3_cropped_510x510.webp",
                      fit: BoxFit.cover),
                    ),
                    // btns
                    Container(
                      color: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(backgroundColor: Colors.amber),
                          CircleAvatar(backgroundColor: Colors.amber),
                          CircleAvatar(backgroundColor: Colors.amber),
                          CircleAvatar(backgroundColor: Colors.amber),
                          CircleAvatar(backgroundColor: Colors.amber),
                          CircleAvatar(backgroundColor: Colors.amber)
                        ],
                      )
                    )
                  ],
                ),
              )),
            //footer
            Container(
              color: Colors.lightGreen,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Text(
                "группа 22/1093",
                style: TextStyle(fontSize: 14, color: Colors.white24),
                textAlign: TextAlign.center
              ),
            )
          ],
        )
      )
    );
  }
}
