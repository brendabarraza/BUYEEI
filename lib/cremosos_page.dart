import 'package:flutter/material.dart';
import 'producto_page.dart';

class CremososPage extends StatefulWidget {
  @override
  _CremososPageState createState() => _CremososPageState();
}

class _CremososPageState extends State<CremososPage> {
  List<Producto> productos = [
    Producto(
      titulo: 'Helado de Vainilla',
      descripcion: 'Clásico helado de vainilla',
      precio: 3.99,
      puntos: 25,
      imagen: 'assets/cremosos/cremosos1.png',
      ima: 'assets/cremosos/c_1.png',
    ),
    Producto(
      titulo: 'Helado de Chocolate',
      descripcion: 'Delicioso helado de chocolate',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/cremosos/cremosos2.png',
      ima: 'assets/cremosos/c_2.png',
    ),
    Producto(
      titulo: 'Helado de Caramelo',
      descripcion: 'Irresistible helado de caramelo',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/cremosos/cremosos3.png',
      ima: 'assets/cremosos/c_3.png',
    ),
    Producto(
      titulo: 'Helado de Menta',
      descripcion: 'Refrescante helado de menta',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/cremosos/cremosos4.png',
      ima: 'assets/cremosos/c_4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helados Cremosos'),
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

