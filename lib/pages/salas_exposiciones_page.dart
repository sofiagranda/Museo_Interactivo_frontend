import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(SalasExposicionesPage());
}
class SalasExposicionesPage extends StatefulWidget {
  @override
  _SalasScreenState createState() => _SalasScreenState();
}

class _SalasScreenState extends State<SalasExposicionesPage> {
  String selectedSala = 'Historia';
  Map<String, List<String>> exposiciones = {
    'Historia': ['Egipto Antiguo', 'Roma Clásica', 'La Edad Media'],
    'Arte moderno': ['Impresionismo', 'Cubismo', 'Surrealismo'],
    'Ciencia': ['Física Cuántica', 'Astronomía', 'Genética'],
    'Cultura local': ['Música tradicional', 'Danza Folklórica', 'Artesanía'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas y Exposiciones'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/mamut_ciencia.jpg'), 
          DropdownButton<String>(
            value: selectedSala,
            onChanged: (newSala) {
              setState(() {
                selectedSala = newSala!;
              });
            },
            items: ['Historia', 'Arte moderno', 'Ciencia', 'Cultura local']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exposiciones[selectedSala]!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(exposiciones[selectedSala]![index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
