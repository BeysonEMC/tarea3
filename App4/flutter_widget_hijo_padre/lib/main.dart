import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Child to Parent Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _messageFromChild = 'No message yet';

  // Esta función se pasará al hijo para recibir datos desde él
  void _updateMessage(String message) {
    setState(() {
      _messageFromChild = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _messageFromChild,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 20),
          ChildWidget(onMessageChanged: _updateMessage),
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(String) onMessageChanged;

  // Constructor para recibir la función de devolución de llamada desde el padre
  ChildWidget({required this.onMessageChanged});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Enviar un mensaje al padre a través de la función de devolución de llamada
        onMessageChanged('Hello from ChildWidget!');
      },
      child: Text('Send Message to Parent'),
    );
  }
}
