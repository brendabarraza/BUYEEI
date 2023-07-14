import 'package:flutter/material.dart';
import 'puntos_provider.dart';
import 'package:provider/provider.dart';
import 'carrito_provider.dart';
import 'carrito_page.dart';
import 'producto_page.dart';

class Cuatromil extends StatelessWidget {
  final List<List<dynamic>> items;

  Cuatromil({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF241E1E),
        title: Text(''),
      ),
      backgroundColor: Color(0xFF241E1E),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          String image = items[index][0];
          String title = items[index][1];
          String description = items[index][2];
          int value1 = items[index][3];
          int value2 = items[index][4];
          int value3 = items[index][5];
          int value4 = items[index][6];

          return ListTile(
            leading: Image.asset(image),
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '-$value3',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
                    if (puntosProvider.totalPoints >= 1000) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmar'),
                            content: Text('¿Deseas gastar tus puntos en este producto?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Cierra el diálogo sin realizar ninguna acción
                                },
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  final carritoProvider = Provider.of<CarritoProvider>(context, listen: false);
                                  Producto producto = Producto(
                                    titulo: title,
                                    descripcion: description,
                                    imagen: image,
                                    precio: 0,
                                    puntos: 0, ima: '',
                                  );
                                  carritoProvider.agregarProducto(producto);

                                  puntosProvider.subtractPoints(1000); // Resta 1000 puntos del proveedor

                                  Navigator.pop(context); // Cierra el diálogo

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CarritoPage(),
                                    ),
                                  );
                                },
                                child: Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Puntos insuficientes'),
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.discount, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

