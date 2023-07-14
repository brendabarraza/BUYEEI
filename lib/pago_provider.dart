import 'package:flutter/foundation.dart';
import 'producto_page.dart'; // Asegúrate de importar la clase Producto

class PagoProvider extends ChangeNotifier {
  List<Producto> _productos = [];

  List<Producto> get productos => _productos;

  double get total => _productos.fold(0, (total, producto) => total + producto.precio);

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  void eliminarProducto(Producto producto) {
    _productos.remove(producto);
    notifyListeners();
  }
}
