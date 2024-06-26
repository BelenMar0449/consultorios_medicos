import 'package:flutter/material.dart';
import 'lista_screen.dart';
import 'historial_screen.dart';
import 'citas_creen.dart';
import 'perfil_screen.dart';
import 'MongoDbModel.dart';

class pacienteScreen extends StatefulWidget {
  final MongoDbModel user;

  const pacienteScreen({super.key, required this.user});

  @override
  State<pacienteScreen> createState() => _pacienteScreenState();
}

class _pacienteScreenState extends State<pacienteScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      const listaScreen(),
      const historialScreen(),
      const citasScreen(),
      perfilScreen(user: widget.user),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hospital San Jose',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information, color: Colors.lightBlueAccent,),
            label: 'Medicos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.lightBlueAccent,),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.lightBlueAccent,),
            label: 'Citas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.lightBlueAccent,),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.blueGrey,
      ),
    );
  }
}