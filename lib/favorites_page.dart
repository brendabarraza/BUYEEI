import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'producto_page.dart';
import 'favorites_provider.dart';
import 'carrito_provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final List<Producto> productos = favoritesProvider.productos;
    final carritoProvider = Provider.of<CarritoProvider>(context, listen: false);

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
        title: Text('FAVORITOS'),
      ),
      backgroundColor: Color(0xFF444141),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          Producto producto = productos[index];
          return Dismissible(
            key: Key(producto.titulo),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              favoritesProvider.eliminarProductoFavorito(producto);
            },
            child: ListTile(
              leading: Image.asset(
                producto.imagen,
                width: 50,
                height: 50,
              ),
              title: Text(
                producto.titulo,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                producto.descripcion,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: GestureDetector(
                onTap: () {
                  carritoProvider.agregarProducto(producto);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$${producto.precio.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



