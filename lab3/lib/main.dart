import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

   const String supabaseUrl = 'https://diatfsydzbqpfdzwcgil.supabase.co';
   const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpYXRmc3lkemJxcGZkendjZ2lsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEyMTIxNzIsImV4cCI6MjA3Njc4ODE3Mn0.o5w70G_DuDtwR2MEaylJC68g-UTN5dzOJmVVmzVog8w';

    //Инициализация Supabase
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UserPage()
      ),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  List<Map<String, dynamic>> _msgs = [];

  // Метод для добавления пользователя
  Future<void> _sendMsg() async {
    final username = _usernameController.text;
    final text = _textController.text;

    if (username.isEmpty || text.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('Please fill fields username and text')
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    await Supabase.instance.client
      .from('messages')
      .insert({'username': username, 'text': text});

      // Очистить поля после успешной вставки
      _usernameController.text = '';
      _textController.text = '';

      _loadMsgs();
  }

  // Метод для загрузки всех пользователей
  Future<void> _loadMsgs() async {
    final response = await Supabase.instance.client
      .from('messages')
      .select();

      setState(() {
        _msgs = List<Map<String, dynamic>>.from(response as List);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Поля ввода
            SizedBox(
              width: 400,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              )
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Text'),
              )
            ),
            SizedBox(height: 16),
            // Кнопки
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _loadMsgs,
                  child: Text('Load'),
                ),
                ElevatedButton(
                  onPressed: _sendMsg,
                  child: Text('Send'),
                )
              ],
            ),
            SizedBox(height: 16),
            // Список сообщений
            Expanded(
              child: ListView.builder(
                itemCount: _msgs.length,
                itemBuilder: (context, index) {
                  final msg = _msgs[index];
                  return ListTile(
                    title: Text(msg['username'] ?? ''),
                    subtitle: Text(msg['text'] ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
