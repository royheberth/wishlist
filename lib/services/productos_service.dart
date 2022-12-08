import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wishlist/models/producto.dart';

class ProductosService with ChangeNotifier {
  final List<Producto> productos = [];

  ProductosService() {
    getProductos();
  }

  getProductos() async {
    const url = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(url));
    final nuevosProductos = productoFromJson(response.body);
    productos.addAll(nuevosProductos);
    notifyListeners();
  }
}
