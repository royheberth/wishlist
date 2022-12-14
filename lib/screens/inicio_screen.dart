import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/services/services.dart';
import 'package:wishlist/widgets/producto_widget.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductosService productosService =
        Provider.of<ProductosService>(context);
    final CarritoService carritoService = Provider.of<CarritoService>(context);
    final TemaService temaService = Provider.of<TemaService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.snowboarding_rounded),
            SizedBox(width: 5),
            Text("LISTA DE DESEOS"),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, 'carrito'),
            child: Row(
              children: [
                Text("\$ ${carritoService.total.toStringAsFixed(2)}"),
                const SizedBox(width: 5),
                const Icon(
                  Icons.shopping_cart_checkout_sharp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: CustomPreferences.isDark,
            onChanged: (value) =>
                value ? temaService.setDarkMode() : temaService.setLightMode(),
          ),
        ],
      ),
      body: productosService.productos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ResponsiveGridList(
              minItemWidth: 150,
              verticalGridMargin: 10,
              horizontalGridMargin: 40,
              children: List.generate(
                productosService.productos.length,
                (int index) => ProductoWidget(
                  producto: productosService.productos[index],
                ),
              ),
            ),
    );
  }
}
