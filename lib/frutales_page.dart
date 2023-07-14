import 'package:flutter/material.dart';
import 'producto_page.dart';

class FrutalesPage extends StatefulWidget {
  @override
  _FrutalesPageState createState() => _FrutalesPageState();
}

class _FrutalesPageState extends State<FrutalesPage> {
  List<Producto> productos = [
    Producto(
      titulo: 'Helado de Fresa',
      descripcion: 'Delicioso helado de fresa',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/frutales/frutales1.png',
      ima:  'assets/frutales/f_1.png',
    ),
    Producto(
      titulo: 'Helado de Mango',
      descripcion: 'Irresistible helado de mango',
      precio: 5.99,
      puntos: 35,
      imagen: 'assets/frutales/frutales2.png',
      ima:  'assets/frutales/f_2.png',
    ),
    Producto(
      titulo: 'Helado de Piña',
      descripcion: 'Refrescante helado de piña',
      precio: 4.99,
      puntos: 30,
      imagen: 'assets/frutales/frutales3.png',
      ima:  'assets/frutales/f_3.png',
    ),
    Producto(
      titulo: 'Helado de Sandía',
      descripcion: 'Sabroso helado de sandía',
      precio: 5.99,
      puntos: 35,
      imagen: 'assets/frutales/frutales4.png',
      ima:  'assets/frutales/f_4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helados Frutales'),
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
