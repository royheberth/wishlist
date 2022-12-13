import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/models/producto.dart';
import 'package:wishlist/services/carrito_service.dart';
import 'package:wishlist/services/productos_service.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductosService productosService =
        Provider.of<ProductosService>(context);
    final CarritoService carritoService = Provider.of<CarritoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, 'carrito'),
            child: Row(
              children: [
                Text(
                  "\$ ${carritoService.total.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: productosService.productos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ResponsiveGridList(
              minItemWidth: 190,
              verticalGridMargin: 40,
              horizontalGridMargin: 40,
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
                child: const Text("Ver más"),
                onPressed: () => showModalBottomSheet(
                  builder: (_) => ShowDataModal(producto: producto),
                  context: context,
                ),
              ),
            ],
          ),
        ),
      );
}

class ShowDataModal extends StatelessWidget {
  final Producto producto;

  const ShowDataModal({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarritoService carrito = Provider.of<CarritoService>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(
          height: double.infinity,
          image: NetworkImage(producto.image),
        ),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(producto.title),
            const SizedBox(height: 10),
            Text("Price: \$ ${producto.price.toStringAsFixed(2)}"),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("AGREGAR"),
              onPressed: () => carrito.agregarProducto(producto),
            ),
          ],
        ),
      ],
    );
  }
}
