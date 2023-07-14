import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'producto_page.dart';

class CarritoProvider extends ChangeNotifier {
  List<Producto> productos = [];

  double get total {
    double sum = 0;
    for (var producto in productos) {
      sum += producto.precio;
    }
    return sum;
  }

  void agregarProducto(Producto producto) {
    productos.add(producto);
    notifyListeners();
  }


  void eliminarProducto(Producto producto) {
    productos.remove(producto);
    notifyListeners();
  }

  void eliminarTodosLosProductos() {
    productos.clear();
    notifyListeners();
  }
}

