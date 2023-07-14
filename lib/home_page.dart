import 'package:flutter/material.dart';
import 'frutales_page.dart';
import 'cremosos_page.dart';
import 'tortas_page.dart';
import 'especiales_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFF241E1E),
        child: ListView(
          children: [
            ListTile(
              title: Text('CONFIGURACION', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.settings, color: Colors.white38),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('PEDIDOS', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.receipt_sharp, color: Colors.white38),
              onTap: () {
                Navigator.pushNamed(context, '/pedidos');
              },
            ),
            ListTile(
              title: Text('NOSOTROS', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.info, color: Colors.white38),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF362618),
      appBar: AppBar(
        backgroundColor: Color(0xFF241E1E),
        title: Text('HOME'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          Container(
            color: Color(0xFF362618), // Color de fondo del botón
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/especiales');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF362618), // Color de fondo del botón
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/especiales.png'), // Reemplaza 'assets/especiales.png' con la ruta de tu imagen
                  Text(
                    'ESPECIALES',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal, color: Colors.white), // Tamaño de fuente 45
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Color(0xFF362618), // Color de fondo del botón
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/frutales');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF362618), // Color de fondo del botón
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/frutales.png'), // Reemplaza 'assets/frutales.png' con la ruta de tu imagen
                  Text(
                    'FRUTALES',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal, color: Colors.white), // Tamaño de fuente 45
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Color(0xFF362618), // Color de fondo del botón
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tortas');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF362618), // Color de fondo del botón
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/tortas.png'), // Reemplaza 'assets/tortas.png' con la ruta de tu imagen
                  Text(
                    'TORTAS',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal, color: Colors.white), // Tamaño de fuente 45
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Color(0xFF362618),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cremosos');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF362618), // Color de fondo del botón
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/cremosos.png'), // Reemplaza 'assets/cremosos.png' con la ruta de tu imagen
                  Text(
                    'CREMOSOS',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal, color: Colors.white), // Tamaño de fuente 45
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
