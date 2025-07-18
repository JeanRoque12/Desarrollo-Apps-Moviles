import 'package:flutter/material.dart';
import 'package:api_y_transiciones_app/services/api_service.dart';
import 'second_page.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService(
    'https://jsonplaceholder.typicode.com',
  );

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Título: ${data['title']}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SecondPage()),
                    );
                  },
                  child: Text('Ir a segunda página'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
