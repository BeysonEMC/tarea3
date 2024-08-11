import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Data Passing Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Datos que queremos enviar al widget hijo
            final String message = 'Hello from HomeScreen!';
            
            // Navegar a la pantalla de detalles y pasar los datos
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(message: message),
              ),
            );
          },
          child: Text('Go to Details Screen'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  // Parámetro recibido desde el widget padre
  final String message;

  // Constructor para recibir los datos
  DetailsScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          message, // Mostrar el mensaje recibido
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
