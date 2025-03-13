import 'package:flutter/material.dart';

class DeliveredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entregados'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'No hay entregas disponibles',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
