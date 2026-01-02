import 'package:flutter/material.dart';
import 'dart:async';

class PantallaMeditacion extends StatefulWidget {

  final String nombreUsuario;
  final int duracion;
  const PantallaMeditacion({super.key, required this.nombreUsuario, required this.duracion});

  @override
  _PantallaMeditacionState createState() => _PantallaMeditacionState();
}

class _PantallaMeditacionState extends State<PantallaMeditacion> {
  
  late int _segundosRestantes;
  Timer? _timer; // El signo '?' significa que puede ser nulo al principio
  bool _estaCorriendo = false;

  // se ejecuta UNA SOLA VEZ al entrar en la pantalla
  @override
  void initState() {
    super.initState();
    _segundosRestantes = widget.duracion * 60; 
  }


  // MÉTODO PARA INICIAR/PAUSAR
  void _toggleTimer() {
    if (_estaCorriendo) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_segundosRestantes > 0) {
            _segundosRestantes--;
        
          } else {
            _timer?.cancel();
            _estaCorriendo = false;

            //funcion alerta
            _mostrarAlertaFelicidades();
          }
        });
      });
    }

    setState(() {
      _estaCorriendo = !_estaCorriendo;
    });
  } 
  
  void _mostrarAlertaFelicidades() {
    showDialog(
      context: context,
      barrierDismissible: false, // Obliga al usuario a pulsar el botón
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¡Sesión completada!"),
          content: Text("Buen trabajo, ${widget.nombreUsuario}."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                Navigator.pop(context); // Vuelve a la lista de meditaciones
              },
              child: const Text("Volver al inicio"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // IMPORTANTE: Apagamos el reloj si el usuario se va de la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    int minutos = _segundosRestantes ~/ 60; 
    int segundos = _segundosRestantes % 60;
    String minutosTexto = minutos.toString().padLeft(2, '0');
    String segundosTexto = segundos.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text("Sesión de meditación"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.spa, size: 80, color: Colors.teal[200]),
            SizedBox(height: 20),
            Text(
              "Respira, ${widget.nombreUsuario}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              "$minutosTexto:$segundosTexto",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 40),
            //boton iniciar/pausar
            FloatingActionButton(
              onPressed: _toggleTimer,
              backgroundColor: Colors.teal,
              child: Icon(_estaCorriendo ? Icons.pause : Icons.play_arrow, color:Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}