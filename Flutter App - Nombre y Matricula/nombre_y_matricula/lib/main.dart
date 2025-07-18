import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Mostrar Nombre y Matrícula',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Nombre y Matrícula'),
    );
  }
}

class MyStatefulSection extends StatefulWidget {
  const MyStatefulSection({super.key});

  @override
  _MyStatefulSectionState createState() => _MyStatefulSectionState();
}

class _MyStatefulSectionState extends State<MyStatefulSection> {
  String _nombre = '';
  String _matricula = "";

  void _changeText() {
    setState(() {
      _nombre = "Jean Roque";
      _matricula = '23-0812';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            _changeText();
          },
          child: const Text('Mostrar Nombre y Matricula'),
        ),
        Text(_nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(_matricula, style: const TextStyle(fontStyle: FontStyle.italic)),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(child: MyStatefulSection()),
    );
  }
}
