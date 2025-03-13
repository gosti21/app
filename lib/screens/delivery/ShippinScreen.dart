import 'package:flutter/material.dart';

class ShippinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Envios'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'No hay envios recientes',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
