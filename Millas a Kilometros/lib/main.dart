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
      debugShowCheckedModeBanner: false,
      title: 'Conversion de Unidades',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversion de Unidades'),
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
  final TextEditingController _millas = TextEditingController();
  String _resultado = "";
  String _millasValorFinal = "";
  String _mensaje = "";
  String _comparacion = "";

  void _doConversion() async {
    final millasValor = _millas.text.trim();

    if (millasValor.isEmpty) {
      setState(() {
        _mensaje = "Por favor ingrese un número";
        _resultado = "";
        _comparacion = "";
        _millasValorFinal = "";
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        _mensaje = "";
      });
      return;
    }

    final valor = double.tryParse(millasValor);
    if (valor == null) {
      setState(() {
        _mensaje = "Entrada no válida";
        _resultado = "";
        _comparacion = "";
        _millasValorFinal = "";
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        _mensaje = "";
      });
      return;
    }

    // Todo bien, hacer conversión
    setState(() {
      _mensaje = "";
      double kilometro = (valor * 1.60934);
      _resultado = "$kilometro Kilómetros";
      _millas.text = "";
      _millasValorFinal = "$millasValor Millas  |  ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Conversor de Millas a Kilómetros',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _millas,
                      decoration: const InputDecoration(
                        labelText: "Ingrese las millas",
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.send),
                    onPressed: _doConversion,
                    tooltip: "Convertir",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                _mensaje,
                style: const TextStyle(color: Colors.red, fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text(
                _resultado,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_millasValorFinal, style: const TextStyle(fontSize: 15)),
                Text(_resultado, style: const TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//https://notepad.pw/fltter9090f
