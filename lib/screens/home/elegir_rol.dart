import 'package:app/screens/admin/admin_screen.dart';
import 'package:app/screens/delivery/delivery_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ElegirRolScreen(),
    );
  }
}

class ElegirRolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Elegir Rol',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RolButton(
              text: 'Administrador',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            RolButton(
              text: 'Delivery',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RolButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RolButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, 
      height: 50, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), 
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
