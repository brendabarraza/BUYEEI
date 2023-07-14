import 'package:flutter/material.dart';
import 'producto_page.dart';

class EspecialesPage extends StatefulWidget {
  @override
  _EspecialesPageState createState() => _EspecialesPageState();
}

class _EspecialesPageState extends State<EspecialesPage> {
  List<Producto> productos = [
    Producto(
      titulo: 'Helado de Vainilla',
      descripcion: 'Clásico helado de vainilla',
      precio: 3.99,
      puntos: 25,
      imagen: 'assets/especiales/especiales1.png',
      ima: 'assets/especiales/e_1.png',
    ),
    Producto(
      titulo: 'Helado de Chocolate',
      descripcion: 'Delicioso helado de chocolate',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/especiales/especiales2.png',
      ima: 'assets/especiales/e_2.png',
    ),
    Producto(
      titulo: 'Helado de Fresa',
      descripcion: 'Irresistible helado de fresa',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/especiales/especiales3.png',
      ima: 'assets/especiales/e_3.png',
    ),
    Producto(
      titulo: 'Helado de Menta',
      descripcion: 'Refrescante helado de menta',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/especiales/especiales4.png',
      ima: 'assets/especiales/e_4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helados Especiales'),
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

