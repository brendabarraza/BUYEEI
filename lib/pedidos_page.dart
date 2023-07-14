import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pedidos_provider.dart';
import 'producto_page.dart';

class PedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PedidosProvider>(
      builder: (context, pedidosProvider, _) {
        final pedidosProvider = Provider.of<PedidosProvider>(context);
        final List<Producto> productos = pedidosProvider.productos;

        return Scaffold(
          appBar: AppBar(
            title: Text('Pedidos'),backgroundColor: Color(0xFF241E1E),
          ),
          backgroundColor: Color(0xFF444141),
          body: ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              Producto producto = productos[index];
              return ListTile(
                title: Text(producto.titulo, style: TextStyle(fontSize: 14, color: Colors.white),),
                subtitle: Text(producto.descripcion, style: TextStyle(fontSize: 14, color: Colors.white),),
                trailing: Text('\$${producto.precio.toStringAsFixed(2)}', style: TextStyle(fontSize: 14, color: Colors.white),),
              );
            },
          ),
        );
      },
    );
  }
}
