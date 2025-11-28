import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DonacionesScreen extends StatefulWidget {
  @override
  _DonacionesScreenState createState() => _DonacionesScreenState();
}

class _DonacionesScreenState extends State<DonacionesScreen> {
  final _salaController = TextEditingController();
  final _montoController = TextEditingController();
  List<Map<String, dynamic>> donaciones = [];

  void _agregarDonacion() {
    final sala = _salaController.text.trim();
    final monto = double.tryParse(_montoController.text.trim());

    if (sala.isEmpty || monto == null || monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingrese un monto válido mayor que 0')),
      );
      return;
    }

    setState(() {
      donaciones.add({'sala': sala, 'monto': monto});
    });

    _salaController.clear();
    _montoController.clear();
  }

  void _eliminarDonacion(int index) {
    setState(() {
      donaciones.removeAt(index);
    });
  }

  void _calcularResumen() {
    double total = 0;
    double promedio = 0;

    if (donaciones.isNotEmpty) {
      total = donaciones.fold(0, (sum, donacion) => sum + donacion['monto']);
      promedio = total / donaciones.length;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resumen de Donaciones'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total Recaudado: \$${total.toStringAsFixed(2)}'),
            Text('Promedio por Donación: \$${promedio.toStringAsFixed(2)}'),
            Text('Cantidad de Donaciones: ${donaciones.length}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Donaciones')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _salaController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto'),
            ),
            ElevatedButton(
              onPressed: _agregarDonacion,
              child: Text('Agregar Donación'),
            ),
            ElevatedButton(
              onPressed: _calcularResumen,
              child: Text('Calcular Resumen de Donaciones'),
            ),
          ],
        ),
      ),
    );
  }
}
