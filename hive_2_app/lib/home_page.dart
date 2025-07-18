import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  late Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('userBox');
  }

  void saveUserData(String email, String name) {
    box.put('email', email);
    box.put('name', name);
    setState(() {}); // para actualizar saludo
  }

  String getUserEmail() => box.get('email', defaultValue: '');
  String getUserName() => box.get('name', defaultValue: '');

  @override
  Widget build(BuildContext context) {
    final email = getUserEmail();
    final name = getUserName();

    return Scaffold(
      appBar: AppBar(title: Text('Hive Storage')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (name.isNotEmpty)
              Text('Hola, $name 👋', style: TextStyle(fontSize: 22)),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveUserData(emailController.text, nameController.text);
              },
              child: Text('Guardar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
