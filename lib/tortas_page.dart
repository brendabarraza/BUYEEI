import 'package:flutter/material.dart';
import 'producto_page.dart';

class TortasPage extends StatefulWidget {
  @override
  _TortasPageState createState() => _TortasPageState();
}

class _TortasPageState extends State<TortasPage> {
  List<Producto> productos = [
    Producto(
      titulo: 'Torta 1',
      descripcion: 'Deliciosa torta de chocolate',
      precio: 10.99,
      puntos: 50,
      imagen: 'assets/tortas/torta1.png',
      ima: 'assets/tortas/t_1.png',
    ),
    Producto(
      titulo: 'Torta 2',
      descripcion: 'Irresistible torta de fresas',
      precio: 12.99,
      puntos: 60,
      imagen: 'assets/tortas/torta2.png',
      ima: 'assets/tortas/t_2.png',
    ),
    Producto(
      titulo: 'Torta 3',
      descripcion: 'Exquisita torta de vainilla',
      precio: 9.99,
      puntos: 40,
      imagen: 'assets/tortas/torta3.png',
      ima: 'assets/tortas/t_3.png',
    ),
    Producto(
      titulo: 'Torta 4',
      descripcion: 'Sabrosa torta de zanahoria',
      precio: 11.99,
      puntos: 55,
      imagen: 'assets/tortas/torta4.png',
      ima: 'assets/tortas/t_4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helados Torta'),
        backgroundColor: Color(0xFF241E1E),
      ),
      backgroundColor: Color(0xFF362618),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(
          left: 20,
          top: 30,
          right: 20,
          bottom: 10,
        ),
        mainAxisSpacing: 20, // Espaciado vertical entre filas
        crossAxisSpacing: 10, // Espaciado horizontal entre columna
        children: productos.map((producto) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductoPage(producto: producto),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.7, // Ajusta la altura de la tarjeta según tus necesidades
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.44, // Establece la altura de la imagen
                    child: Image.asset(
                      producto.imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.black.withOpacity(0.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            producto.titulo,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${producto.precio.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}



