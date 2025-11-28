import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan de Visita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlanScreen(),
    );
  }
}

class PlanScreen extends StatefulWidget {
  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List<TextEditingController> _controllers = [];
  int _numSalas = 4;
  String _resultado = '';
  
  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    for (int i = 0; i < _numSalas; i++) {
      _controllers.add(TextEditingController());
    }
  }

  void _calcularTiempoTotal() {
    int total = 0;
    for (var controller in _controllers) {
      if (controller.text.isNotEmpty) {
        total += int.parse(controller.text);
      }
    }

    String mensaje = '';
    if (total < 60) {
      mensaje = 'Visita corta';
    } else if (total >= 60 && total <= 120) {
      mensaje = 'Visita media';
    } else {
      mensaje = 'Visita larga';
    }

    setState(() {
      _resultado = 'Tiempo total: $total minutos\n$mensaje';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan de Visita'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Ingresa el tiempo estimado de visita en cada sala:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Column(
              children: List.generate(_numSalas, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Sala ${index + 1}',
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularTiempoTotal,
              child: Text('Calcular tiempo total'),
            ),
            SizedBox(height: 16),
            if (_resultado.isNotEmpty)
              Text(
                _resultado,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
