import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Map для списка преподавателей
List<Map<String, dynamic>> teachers = [
  {
    'position': 'Профессор',
    'name': 'Иванов И.И.',
    'phone': '+7 (999) 123-45-67'
  },
  {
    'position': 'Доцент',
    'name': 'Петрова П.П.',
    'phone': '+7 (999) 123-45-68'
  }
];

// Map для списка предметов
List<Map<String, dynamic>> subjects = [
  {
    'name': 'Математика',
    'duration': 90,
    'day': 'Понедельник'
  },
  {
    'name': 'Физика',
    'duration': 120,
    'day': 'Вторник'
  }
];


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page.")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[50],
                textStyle: TextStyle(
                  fontSize: 24
                )
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PrepPage())
                );
              },
              child: Text("К преподавателям.")
            ),
            Container(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[50],
                textStyle: TextStyle(
                  fontSize: 24
                )
              ),
              onPressed:  () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudPage())
                );
              },
              child: Text("К предметам.")
            )
        ],)
      )
    );
  }
}

class PrepPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Преподы")
      ),
      body: ListView(
        children: [
          ...List.generate(
            teachers.length, (index) {
              return ListTile(
                leading: const Icon(Icons.account_box),
                title: Text(teachers[index]['name']),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PrepInfo(id: index))
                  );
                }
              );
            }
          )
        ])
    );
  }
}

class PrepInfo extends StatelessWidget {
  final int id;
  const PrepInfo({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Препод")
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Должность - ${teachers[id]?['position']}\n", style: TextStyle(fontSize: 40)),
              TextSpan(text: "Имя преподавателя - ${teachers[id]?['name']}\n"),
              TextSpan(text: "Номер телефона - ${teachers[id]?['phone']}\n")
          ])
        
        ),
      )
    );
  }
}

class StudPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Предметы")
      ),
      body: ListView(
        children: [
          ...List.generate(
            teachers.length, (index) {
              return ListTile(
                leading: const Icon(Icons.add_chart_rounded),
                title: Text(subjects[index]['name']),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StudInfo(id: index))
                  );
                }
              );
            }
          )
        ])
    );
  }
}

class StudInfo extends StatelessWidget {
  final int id;
  const StudInfo({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Предмет")
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Название - ${subjects[id]?['name']}\n", style: TextStyle(fontSize: 40)),
              TextSpan(text: "Количество часов - ${subjects[id]?['duration']}\n"),
              TextSpan(text: "День недели - ${subjects[id]?['day']}\n")
          ])
        
        ),
      )
    );
  }
}
