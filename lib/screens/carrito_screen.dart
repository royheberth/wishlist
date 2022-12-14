import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/services/services.dart';
import 'package:wishlist/widgets/carrito_widget.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarritoService carritoService = Provider.of<CarritoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("DETALLES"),
        actions: <Widget>[
          Row(
            children: [
              Text(
                "\$ ${carritoService.total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.shopping_cart_outlined),
              const SizedBox(width: 5),
            ],
          ),
        ],
      ),
      body: carritoService.productos.isEmpty
          ? const Center(
              child: Text(
                "No hay productos agregados a la lista de deseos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 24,
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: carritoService.productos.length,
              itemBuilder: (_, int index) => CarritoWidget(
                producto: carritoService.productos[index],
                index: index,
              ),
            ),
    );
  }
}
