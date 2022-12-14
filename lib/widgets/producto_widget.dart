import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/models/producto.dart';
import 'package:wishlist/services/carrito_service.dart';

class ProductoWidget extends StatelessWidget {
  final Producto producto;

  const ProductoWidget({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            children: <Widget>[
              Image(
                width: 100,
                height: 150,
                image: NetworkImage(producto.image),
              ),
              const SizedBox(height: 10),
              Text(
                producto.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Price: \$ ${producto.price.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Agregar"),
                onPressed: () =>
                    Provider.of<CarritoService>(context, listen: false)
                        .agregarProducto(producto),
              ),
            ],
          ),
        ),
      );
}