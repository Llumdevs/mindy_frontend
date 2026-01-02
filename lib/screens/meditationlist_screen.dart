import 'package:flutter/material.dart';
import '../models/meditation.dart';
import 'meditation_screen.dart';

class MeditationlistScreen extends StatelessWidget{

  final String nombreUsuario;
  MeditationlistScreen({required this.nombreUsuario});

  //simulacion de datos
  final List<Meditation> meditaciones = [
    Meditation(titulo: "Meditación para principiantes", duracion: 10, icono: Icons.self_improvement),
    Meditation(titulo: "Meditación para el estrés", duracion: 15, icono: Icons.spa),
    Meditation(titulo: "Meditación para dormir mejor", duracion: 20, icono: Icons.nightlight_round),
    Meditation(titulo: "Meditación guiada de atención plena", duracion: 12, icono: Icons.visibility),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("$nombreUsuario, elige tu meditación")), 
      body: ListView.builder(
        itemCount: meditaciones.length,
        itemBuilder: (context, index){
          final meditation = meditaciones[index];
          return ListTile(
            leading: Icon(meditation.icono, color: Colors.teal),
            title: Text(meditation.titulo),
            subtitle: Text("Duración: ${meditation.duracion}"),
            onTap: (){
              Text("Has seleccionado: ${meditation.titulo}");
              // Navegar a la pantalla de meditación al seleccionar una meditación
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaMeditacion(nombreUsuario: nombreUsuario, duracion: meditation.duracion),
                ),
              );
            },
          );
        },
      ),
    );
  }
}