import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/services/carrito_service.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarritoService carritoService = Provider.of<CarritoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito"),
        actions: <Widget>[
          Row(
            children: [
              Text(
                "\$ ${carritoService.total.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: carritoService.productos.length,
        itemBuilder: (_, int index) => Column(
          children: <Widget>[
            Text(carritoService.productos[index].title),
            const SizedBox(height: 10),
            Text("\$ ${carritoService.productos[index].price}"),
            const SizedBox(height: 10),
            IconButton(
              icon: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
              ),
              onPressed: () => carritoService.eliminarProducto(index),
            ),
          ],
        ),
      ),
    );
  }
}
