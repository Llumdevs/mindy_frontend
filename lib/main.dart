import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importamos la pantalla de inicio

void main() {
  runApp(MindyApp());
}

class MindyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mindy App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true, // Activa el diseño moderno de Android
      ),
      home: HomeMindy(),
    );
  }
}