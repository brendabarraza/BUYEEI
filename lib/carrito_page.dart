import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrito_provider.dart';
import 'producto_page.dart';
import 'pago_page.dart';

class CarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);
    final List<Producto> productos = carritoProvider.productos;

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
        title: Text('CARRITO'),
      ),
      backgroundColor: Color(0xFF444141),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          Producto producto = productos[index];
          return Dismissible(
            key: Key(producto.titulo),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              carritoProvider.eliminarProducto(producto);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
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
              trailing: Text(
                '\$${producto.precio.toStringAsFixed(2)}\nPuntos: +${producto.puntos}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PagoPage(),
            ),
          );
        },
        backgroundColor: Colors.brown,
        label: Text('Continuar'),
        icon: Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}





