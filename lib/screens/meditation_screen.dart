import 'package:flutter/material.dart';

class PantallaMeditacion extends StatelessWidget {
  final String nombreUsuario;

  // Constructor que pide el nombre obligatoriamente
  PantallaMeditacion({required this.nombreUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditación en curso"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.spa, size: 80, color: Colors.teal[200]),
            SizedBox(height: 20),
            Text(
              "Cierra los ojos, $nombreUsuario...",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}