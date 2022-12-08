import 'package:flutter/material.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito"),
      ),
      body: Column(
        children: [
          Text(CustomPreferences.obtenerProductos()),
        ],
      ),
    );
  }
}
