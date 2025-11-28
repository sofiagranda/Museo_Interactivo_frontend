import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TiendaRecuerdosPage extends StatefulWidget {
  @override
  _TiendaRecuerdosPageState createState() => _TiendaRecuerdosPageState();
}

class _TiendaRecuerdosPageState extends State<TiendaRecuerdosPage> {
  final Map<String, double> _precios = {
    'Postales': 2.0,
    'Libros': 15.0,
    'Figuras': 10.0,
    'Camisetas': 20.0,
  };

  final Map<String, TextEditingController> _cantidadControllers = {};
  double _totalCompra = 0.0;

  @override
  void initState() {
    super.initState();
    _precios.forEach((key, value) {
      _cantidadControllers[key] = TextEditingController();
    });
  }

  void _calcularCompra() {
    double total = 0.0;
    _cantidadControllers.forEach((key, controller) {
      if (controller.text.isNotEmpty) {
        int cantidad = int.parse(controller.text);
        total += _precios[key]! * cantidad;
      }
    });

    setState(() {
      _totalCompra = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Recuerdos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingresa la cantidad de productos que deseas comprar:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ..._precios.keys.map((producto) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      producto,
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _cantidadControllers[producto],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Cantidad',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularCompra,
              child: Text('Calcular compra'),
            ),
            SizedBox(height: 16),
            if (_totalCompra > 0)
              Text(
                'Total de la compra: \$${_totalCompra.toStringAsFixed(2)}\nGracias por tu compra!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
