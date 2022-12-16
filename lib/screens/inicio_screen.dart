import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/widgets/widgets.dart';
import 'package:wishlist/services/services.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundWidget(
        isHome: true,
        child: ResponsiveGridList(
          minItemWidth: 210,
          verticalGridMargin: 10,
          horizontalGridMargin: 40,
          children: List.generate(
            context.watch<ProductosService>().productos.length,
            (int index) => ProductoWidget(
              producto: context.read<ProductosService>().productos[index],
            ),
          ),
        ),
      ),
    );
  }
}
