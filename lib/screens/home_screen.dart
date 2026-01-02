import 'package:flutter/material.dart';
import 'meditation_screen.dart';       // Necesario para navegar
import '../widgets/custom_button.dart'; // Importamos el widget que factorizamos

class HomeMindy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mindy App"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡Hola, Luz!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Frase del día: Respira hondo",
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30),
            
            // Usamos nuestro widget personalizado y limpio
            BotonPrincipal(
              texto: "Empezar meditación",
              icono: Icons.self_improvement,
              alPulsar: () {
                // Aquí metemos la navegación con la transición que te gustó
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        PantallaMeditacion(nombreUsuario: "Luz"),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}