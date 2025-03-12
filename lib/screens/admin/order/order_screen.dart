import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Map<String, String>> paidOutOrders = []; 
  int orderId = 1; 

  // Controladores del formulario
  final TextEditingController clientController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Lista de Órdenes'),
            actions: [
              IconButton(
                icon: Icon(Icons.add), // Botón "+"
                onPressed: () => _showAddOrderDialog(),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'PAGADO'),
                Tab(text: 'DESPACHADO'),
                Tab(text: 'EN CAMINO'),
                Tab(text: 'ENTREGADO'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _orderList(paidOutOrders), 
              Center(child: Text("No hay órdenes despachadas")),
              Center(child: Text("No hay órdenes en camino")),
              Center(child: Text("No hay órdenes entregadas")),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para mostrar la lista de órdenes
  Widget _orderList(List<Map<String, String>> orders) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                'Orden N° ${orders[index]["id"]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _orderDetail('Cliente', orders[index]["cliente"] ?? ""),
                  _orderDetail('Fecha', orders[index]["fecha"] ?? ""),
                  _orderDetail('Dirección', orders[index]["direccion"] ?? ""),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget para mostrar cada detalle de la orden
  Widget _orderDetail(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  // Mostrar diálogo para agregar una nueva orden
  void _showAddOrderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Nueva Orden'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: clientController,
                decoration: InputDecoration(labelText: 'Cliente'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Fecha'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Dirección'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Agregar'),
              onPressed: () {
                setState(() {
                  paidOutOrders.add({
                    "id": orderId.toString(),
                    "cliente": clientController.text,
                    "fecha": dateController.text,
                    "direccion": addressController.text,
                  });
                  orderId++; 
                  clientController.clear();
                  dateController.clear();
                  addressController.clear();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
