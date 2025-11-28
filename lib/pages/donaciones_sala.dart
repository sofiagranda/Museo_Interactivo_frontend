import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonacionesScreen extends StatefulWidget {
  @override
  _DonacionesScreenState createState() => _DonacionesScreenState();
}

class _DonacionesScreenState extends State<DonacionesScreen> {
  List<Map<String, dynamic>> donaciones = [];
  final TextEditingController salaController = TextEditingController();
  final TextEditingController montoController = TextEditingController();

  void agregarDonacion() {
    final String sala = salaController.text;
    final double monto = double.tryParse(montoController.text) ?? 0;
    if (monto > 0) {
      setState(() {
        donaciones.add({'sala': sala, 'monto': monto});
      });
    }
  }

  void calcularResumen() {
    double total = 0.0;
    donaciones.forEach((donacion) {
      total += donacion['monto'];
    });
    double promedio = donaciones.isNotEmpty
        ? total / donaciones.length
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donaciones'),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Center(child: Text('Your donaciones content here')),
    );
  }
}

