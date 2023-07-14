import 'package:flutter/material.dart';
import 'carrito_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrito_provider.dart';
import 'producto_page.dart';
import 'favorites_provider.dart'; // Importa la página FavoritesPage
import 'favorites_page.dart';

class Producto {
  final String titulo;
  final String descripcion;
  final double precio;
  final int puntos;
  final String imagen;
  final String ima;
  Producto({
    required this.titulo,
    required this.descripcion,
    required this.precio,
    required this.puntos,
    required this.imagen,
    required this.ima,
  });
}

class ProductoPage extends StatefulWidget {
  final Producto producto;

  ProductoPage({required this.producto});

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        backgroundColor: Color(0xFF241E1E),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              if (isFavorite) {
                // Agregar lógica para guardar el producto en favoritos
                final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
                favoritesProvider.agregarProductoFavorito(widget.producto);
              } else {
                // Agregar lógica para eliminar el producto de favoritos
                final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
                favoritesProvider.eliminarProductoFavorito(widget.producto);
              }
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF000000),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.producto.ima),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.producto.titulo,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  widget.producto.descripcion,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  '\$${widget.producto.precio.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'Puntos: ${widget.producto.puntos}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    final carritoProvider = Provider.of<CarritoProvider>(context, listen: false);
                    carritoProvider.agregarProducto(widget.producto);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarritoPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white), // Icono del carrito
                      SizedBox(width: 8), // Espacio entre el icono y el texto
                      Text(
                        'Agregar al carrito',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


