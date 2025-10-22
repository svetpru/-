import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyFirstPage()
      ),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1")
      ),
      body: Center(
        child: Container(
          color: Colors.deepPurple[200],
          width: double.infinity,
          height: 100,
          child: Text("This is page 1.")
        )
      ),
      drawer: const MyDrawerWidget(),
    );
  }
}

class MySecondPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2")
      ),
      body: Center(
        child: Container(
          color: Colors.yellow[700],
          width: double.infinity,
          height: 100,
          child: Text("This is page 2.")
        )
      ),
      drawer: const MyDrawerWidget(),
    );
  }
}

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[100],
      child: ListView(
        children: [
          const DrawerHeader(
            child: Icon(Icons.home, size: 35)
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('To page 1.'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyFirstPage())
              );
            }
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('To page 2.'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MySecondPage())
              );
            }
          )
        ])
    );
  }
}