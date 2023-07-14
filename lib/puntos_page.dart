import 'package:flutter/material.dart';
import 'puntos_provider.dart';
import 'package:provider/provider.dart';
import 'mil.dart';
import 'dosmil.dart';
import 'tresmil.dart';
import 'cuatromil.dart';

class PuntosPage extends StatelessWidget {
  final int userPoints;

  PuntosPage({required this.userPoints});

  @override
  Widget build(BuildContext context) {
    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    int totalPoints = puntosProvider.totalPoints;

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
      appBar: AppBar(
          backgroundColor: Color(0xFF241E1E),
          title: Text('PUNTOS',
              style: TextStyle(
                fontFamily: 'PassThrough',
                fontSize: 20,  // Tamaño de la fuente
                fontWeight: FontWeight.normal,  // Peso de la fuente
                color: Colors.white,  // Color del texto
              ))
      ),
      backgroundColor: Color(0xFF444141),
      body: DefaultTabController(
        length: 4, // Número de categorías (cremosos, frutales, tortas, especiales)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 22, 100, 0),
              child:
              Text(
                '$totalPoints',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 0, 100, 0),
              child:
              Text(
                'PUNTOS',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white,),
              ),
            ),
            SizedBox(height: 20), // Espacio entre las pestañas y las listas de productos
            TabBar(
              indicatorColor: Colors.white38,
              tabs: [
                Tab(text: '1000'),
                Tab(text: '2000'),
                Tab(text: '3000'),
                Tab(text: '4000'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Mil(items: [
                    ['assets/especiales/e_1.png', 'especial 1', 'Descripción del Producto 1', 100, 10, 1000,totalPoints],
                    ['assets/tortas/t_1.png', 'torta 1', 'Descripción del Producto 1', 100, 10, 1000, totalPoints],
                    ['assets/frutales/f_1.png', 'frutales 1', 'Descripción del Producto 1', 100, 10, 1000, totalPoints],
                    ['assets/cremosos/c_1.png', 'cremosos 1', 'Descripción del Producto 1', 100, 10, 1000, totalPoints],
                  ]),
                  Dosmil(items: [
                    ['assets/especiales/e_2.png', 'especial 2', 'Descripción del Producto 2', 200, 20, 2000, totalPoints],
                    ['assets/tortas/t_2.png', 'torta 2', 'Descripción del Producto 2', 200, 20, 2000, totalPoints],
                    ['assets/frutales/f_2.png', 'frutales 2', 'te', 200, 20, 2000, totalPoints],
                    ['assets/cremosos/c_2.png', 'cremosos 2', 'Descripción del Producto 2', 200, 20, 2000, totalPoints],
                  ]),
                  Tresmil(items: [
                    ['assets/especiales/e_3.png', 'especial 3', 'Descripción del Producto 3', 300, 30, 3000, totalPoints],
                    ['assets/tortas/t_3.png', 'torta 3', 'Descripción del Producto 3', 300, 30, 3000, totalPoints],
                    ['assets/frutales/f_3.png', 'frutales 3', 'Descripción del Producto 3', 300, 30, 3000, totalPoints],
                    ['assets/cremosos/c_3.png', 'cremosos 3', 'Descripción del Producto 3', 300, 30, 3000, totalPoints],
                  ]),
                  Cuatromil(items: [
                    ['assets/especiales/e_4.png', 'especial 4', 'Descripción del Producto 4', 400, 40, 4000, totalPoints],
                    ['assets/tortas/t_4.png', 'torta 4', 'Descripción del Producto 4', 400, 40, 4000, totalPoints],
                    ['assets/frutales/f_4.png', 'frutales 4', 'Descripción del Producto 4', 400, 40, 4000, totalPoints],
                    ['assets/cremosos/c_4.png', 'cremosos 4', 'Descripción del Producto 4', 400, 40, 4000, totalPoints],
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


