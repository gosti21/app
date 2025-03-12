import 'package:flutter/material.dart';
import 'package:app/screens/admin/order/order_screen.dart';


class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
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
                  'Admin User',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'admin@delivery.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Lista de opciones
          Expanded(
            child: ListView(
              children: [
                _buildListTile(Icons.settings, 'Configuración de perfil', context),
                _buildListTile(Icons.lock, 'Cambiar contraseña', context),
                _buildListTile(Icons.swap_horiz, 'Cambiar Rol', context),
                _buildListTile(Icons.dark_mode, 'Modo oscuro', context),
                Divider(),
                _buildListTile(Icons.category, 'Categorías', context),
                _buildListTile(Icons.shopping_cart, 'Productos', context),
                _buildListTile(Icons.delivery_dining, 'Delivery', context),
                _buildListTile(Icons.assignment, 'Órdenes', context, OrderScreen()), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función para crear los elementos de la lista
  Widget _buildListTile(IconData icon, String title, BuildContext context, [Widget? page]) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }
}
