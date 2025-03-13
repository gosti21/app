import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Orden'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'No hay órdenes disponibles',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),

      /* 
      Descomentar cuando haya conexión con la base de datos:

      FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
      
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ORDER ID: ', // Aquí ira  el ID real de la orden
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildDetailRow('Date', ''), // Fecha traída desde la base de datos
                _buildDetailRow('Client', ''), // Cliente traído desde la base de datos
                _buildDetailRow('Address shipping', ''), // Dirección traída desde la base de datos
              ],
            ),
          ),
        ),
      ),
      */
    );
  }

  //comentado para construir las filas de detalles
  /*
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
  */
}
