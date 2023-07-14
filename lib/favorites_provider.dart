import 'package:flutter/material.dart';
import 'producto_page.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Producto> _productosFavoritos = [];

  List<Producto> get productos => _productosFavoritos;

  void agregarProductoFavorito(Producto producto) {
    _productosFavoritos.add(producto);
    notifyListeners();
  }

  void eliminarProductoFavorito(Producto producto) {
    _productosFavoritos.remove(producto);
    notifyListeners();
  }
}
