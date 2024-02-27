import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl para usar DateFormat
import 'app_header.dart';
import 'bottom_nav_bar.dart';

class AgregarGasto extends StatefulWidget {
  const AgregarGasto({super.key});

  @override
  State<AgregarGasto> createState() => _AgregarGastoState();
}

class _AgregarGastoState extends State<AgregarGasto> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime pickedDate = DateTime.now(); // Para guardar la fecha seleccionada

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF1A1D85),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1D85),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1A1D85),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const AgregarGastoPage(),
    );
  }
}

class AgregarGastoPage extends StatefulWidget {
  const AgregarGastoPage({super.key});

  @override
  State<AgregarGastoPage> createState() => _AgregarGastoPage();
}

class _AgregarGastoPage extends State<AgregarGastoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  DateTime pickedDate = DateTime.now(); // Para guardar la fecha seleccionada

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white, // Establece el color de fondo del contenedor a blanco
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descripción:',
                  fillColor: Colors.white, // Color de fondo del campo de texto
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cantidad:',
                  fillColor: Colors.white, // Color de fondo del campo de texto
                  filled: true,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: Colors.white, // Color de fondo del campo desplegable
                  filled: true,
                ),
                hint: const Text('Seleccionar'),
                items: const <String>['Categoría 1', 'Categoría 2', 'Categoría 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: pickedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (date != null && date != pickedDate) {
                    setState(() {
                      pickedDate = date;
                    });
                  }
                },
                child: Text(formattedDate),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF1A1D85), // Color del texto del botón
                  backgroundColor: Colors.white, // Color de fondo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}