import 'package:flutter/material.dart';
import 'package:app/screens/delivery/order/order_details_screen.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repartidor'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Sección de perfil
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Usuario Repartidor',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'repartidor@delivery.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Divider(),

          // Opciones de configuración
          _buildListTile(
              Icons.settings, 'Configuración de perfil', context, null),
          _buildListTile(Icons.lock, 'Cambiar contraseña', context, null),
          _buildListTile(Icons.swap_horiz, 'Cambiar Rol', context, null),
          _buildListTile(Icons.dark_mode, 'Modo oscuro', context, null),

          Divider(),

          // Sección de Delivery
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Delivery',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ),
          _buildListTile(Icons.assignment, 'Órdenes', context,
              OrderDetailsScreen()), // Ahora sí lleva a la pantalla correcta
          _buildListTile(Icons.local_shipping, 'En camino', context, null),
          _buildListTile(Icons.check_circle, 'Entregado', context, null),
        ],
      ),
    );
  }

  Widget _buildListTile(
      IconData icon, String title, BuildContext context, Widget? nextScreen) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (nextScreen != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextScreen));
        }
      },
    );
  }
}
