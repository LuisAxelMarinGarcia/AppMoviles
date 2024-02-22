import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF1A1D85),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/hogar.png', width: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/diagnostico.png', width: 24),
          label: 'Análisis',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/investigar.png', width: 24),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/agregar-archivo.png', width: 24),
          label: 'Agregar gasto',
        ),
      ],
      currentIndex: widget.currentIndex,
      onTap: widget.onItemSelected,
    );
  }
}
