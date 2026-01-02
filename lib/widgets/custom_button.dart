import 'package:flutter/material.dart';

class BotonPrincipal extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback alPulsar; // Definición Técnica: Un alias para una función que no devuelve nada

  BotonPrincipal({
    required this.texto,
    required this.icono,
    required this.alPulsar,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: alPulsar,
      icon: Icon(icono),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}