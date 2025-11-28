import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(MuseoHomePage());
}

class MuseoHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Museo Interactivo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/salas_exposiciones'),
              child: const Text('Salas y Exposiciones'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/plan'),
              child: const Text('Plan de Visita'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/tienda'),
              child: const Text('Tienda de Recuerdos'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/donaciones'),
              child: const Text('Donaciones por Sala'),
            )
          ],
        ),
      ),
    );
  }
}
