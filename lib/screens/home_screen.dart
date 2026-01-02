import 'package:flutter/material.dart';
import 'package:mindy_app/screens/meditationlist_screen.dart';   
import '../widgets/custom_button.dart';

class HomeMindy extends StatefulWidget {
  @override
  _HomeMindyState createState() => _HomeMindyState();
}

class _HomeMindyState extends State<HomeMindy> {
  // El controlador se define AQUÍ para que persista en el estado
  final TextEditingController _nombreUser = TextEditingController();

  @override
  void dispose() { 
  // dispose va fuera del build. Se ejecuta cuando la pantalla muere.
    _nombreUser.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dentro del build solo debe haber lógica de UI y pequeñas variables locales
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mindy App"), 
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿Cómo te llamas?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 20), // const porque el tamaño es fijo
            TextField(
              controller: _nombreUser,
              decoration: const InputDecoration(
                labelText: "Tu nombre",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 30),            
            BotonPrincipal(
              texto: "Empezar meditación",
              icono: Icons.self_improvement,
              alPulsar: () {
                String nombreUsuario = _nombreUser.text.trim();
                
                if (nombreUsuario.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Por favor, ingresa tu nombre.")),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MeditationlistScreen(nombreUsuario: nombreUsuario),
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