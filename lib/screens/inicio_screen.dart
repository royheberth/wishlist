import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/models/producto.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';
import 'package:wishlist/services/productos_service.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductosService productosService =
        Provider.of<ProductosService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, 'carrito'),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: productosService.productos.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ResponsiveGridList(
              horizontalGridMargin: 40,
              verticalGridMargin: 40,
              minItemWidth: 190,
              children: List.generate(
                productosService.productos.length,
                (int index) => ProductBox(
                  producto: productosService.productos[index],
                ),
              ),
            ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final Producto producto;

  const ProductBox({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          children: [
            Image(
              height: 150,
              width: 100,
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
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("Ver más"),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (_) => ShowDataModal(producto: producto),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowDataModal extends StatelessWidget {
  final Producto producto;

  const ShowDataModal({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: double.infinity,
          image: NetworkImage(producto.image),
        ),
        const SizedBox(width: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(producto.title),
            const SizedBox(height: 10),
            Text(
              "Price: \$ ${producto.price.toStringAsFixed(2)}",
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("AGREGAR"),
              onPressed: () => CustomPreferences.agregarProductos(producto),
            ),
          ],
        ),
      ],
    );
  }
}
