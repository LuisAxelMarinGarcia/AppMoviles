import 'package:flutter/material.dart';
import 'agregar-gasto.dart';// Asegúrate de que este archivo exista y contenga una clase AgregarGasto
import 'app_header.dart'; // Custom app header widget, ajusta al archivo correspondiente
import 'bottom_nav_bar.dart'; // Custom bottom navigation bar widget, ajusta al archivo correspondiente

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COIN CRAZE',
      routes: {
        '/agregar-gasto': (context) => const AgregarGasto(), // Ruta para agregar gasto.
      },
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
        textTheme: const TextTheme(
          // Define the default text styling here
        ),
      ),
      initialRoute: '/', // Ruta inicial
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      // Navegar a la página de agregar gasto si el índice es 3
      Navigator.pushNamed(context, '/agregar-gasto');
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey), // Custom app bar widget
      drawer: const Drawer(), // Reemplaza esto con tu widget personalizado si lo tienes
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle('Bienvenido a la App de Gestión de Datos.'),
            _buildSectionContent('Esta aplicación está diseñada para ayudarte a controlar tus gastos y mejorar tu salud financiera. Perfecta para estudiantes, jóvenes profesionales y familias.'),
            _buildSectionTitle('Resumen Financiero.'),
            _buildSectionContent('Con nuestra aplicación, tendrás todo lo que necesitas para gestionar tus finanzas de manera inteligente y alcanzar tus metas de ahorro con facilidad. Registra tus ingresos y gastos y recibe sugerencias prácticas para optimizar tu presupuesto.'),
            _buildSectionTitle('Últimos Gastos.'),
            _buildSectionContent('Con nuestra aplicación, puedes administrar tus finanzas de manera efectiva y controlar tus otros gastos de forma sencilla. ¡Toma el control total de tus finanzas con nosotros!'),
            _buildSectionTitle('Análisis Inteligente de Gastos.'),
            _buildSectionContent('Nuestra aplicación utiliza inteligencia artificial para analizar y gestionar tus datos financieros, ofreciendo sugerencias útiles y facilitando el control de tus gastos.'),
            _buildSectionTitle('¿Necesitas Ayuda?'),
            _buildSectionContent('Con nuestra aplicación, el Análisis Inteligente de Gastos, podrás gestionar tus datos financieros y recibir sugerencias útiles. ¿Necesitas ayuda?'),
            // Considera agregar aquí tus widgets personalizados para diferentes secciones.
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
