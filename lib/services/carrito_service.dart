import 'package:flutter/material.dart';
import 'package:wishlist/models/producto.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

class CarritoService with ChangeNotifier {
  List<Producto> productos;
  double total;

  CarritoService(this.productos, this.total);

  void agregarProducto(Producto producto) {
    total += double.parse(producto.price.toStringAsFixed(2));
    total = total.abs();
    productos.add(producto);
    CustomPreferences.guardarProductos(productos);
    notifyListeners();
  }

  void eliminarProducto(int index) {
    total -= double.parse(productos[index].price.toStringAsFixed(2));
    total = total.abs();
    productos.removeAt(index);
    CustomPreferences.guardarProductos(productos);
    notifyListeners();
  }
}
