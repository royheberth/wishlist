import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/services/productos_service.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ProductosService productosService =
        Provider.of<ProductosService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
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
                (int index) => ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Image(
                          height: 150,
                          width: 100,
                          image: NetworkImage(
                            productosService.productos[index].image,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          productosService.productos[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Price: \$ ${productosService.productos[index].price.toStringAsFixed(2)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
