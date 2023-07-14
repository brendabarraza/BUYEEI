import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'producto_page.dart';

class ProductProvider extends ChangeNotifier {
  List<Producto> _productos = [];

  List<Producto> get productos => _productos;

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  void eliminarProducto(Producto producto) {
    _productos.remove(producto);
    notifyListeners();
  }
}
