import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:wishlist/providers/providers.dart';
import 'package:wishlist/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productProvider =
        Provider.of<ProductsProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: 90,
          width: double.infinity,
          child: ListView.builder(
            itemCount: productProvider.categories.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, int index) => GestureDetector(
              onTap: () => productProvider.selectedCategory =
                  productProvider.categories[index].name,
              child: CategoryWidget(
                category: productProvider.categories[index],
                isSelected: productProvider.selectedCategory ==
                    productProvider.categories[index].name,
              ),
            ),
          ),
        ),
        Expanded(
          child: productProvider.products.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ResponsiveGridList(
                  minItemWidth: 225,
                  verticalGridMargin: 10,
                  horizontalGridMargin: 40,
                  children: List.generate(
                    productProvider.products.length,
                    (index) => ProductWidget(
                      product: productProvider.products[index],
                      index: index,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
