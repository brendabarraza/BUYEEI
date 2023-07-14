import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrito_provider.dart';
import 'producto_page.dart';
import 'pedidos_provider.dart';
import 'puntos_provider.dart';
import 'puntos_page.dart';
import 'perfil_page.dart';
import 'metodopago_page.dart';

class PagoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);
    final List<Producto> productos = carritoProvider.productos;
    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final pedidosProvider = Provider.of<PedidosProvider>(context);

    int puntosTotales = 0;

    for (Producto producto in productos) {
      puntosTotales += producto.puntos;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pago'),
        backgroundColor: Color(0xFF241E1E),
      ),
      backgroundColor: Color(0xFF444141),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                Producto producto = productos[index];
                return ListTile(
                  title: Text(
                    producto.titulo,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    producto.descripcion,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    '\$${producto.precio.toStringAsFixed(2)}\n+${producto.puntos.toStringAsFixed(0)} puntos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MetodoPagoPage()),
                );
              },
              icon: Icon(Icons.credit_card),
              label: Text(
                'Método de pago',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
              icon: Icon(Icons.person),
              label: Text(
                'Información de contacto',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$${carritoProvider.total.toStringAsFixed(2)}\n+${puntosTotales.toStringAsFixed(0)} puntos',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                final carritoProvider =
                Provider.of<CarritoProvider>(context, listen: false);
                final productosPagados = carritoProvider.productos;

                for (Producto producto in productosPagados) {
                  pedidosProvider.agregarProducto(producto);
                }

                puntosProvider.addToTotalPoints(puntosTotales);
                carritoProvider.eliminarTodosLosProductos();
                Navigator.pushNamed(context, '/pedidos');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Pagar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}













