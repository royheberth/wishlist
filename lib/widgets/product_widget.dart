import 'package:wishlist/providers/providers.dart';
import 'package:wishlist/models/models.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final int index;

  const ProductWidget({
    super.key,
    required this.index,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final ShoppingCartProvider cartProvider = Provider.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.white, offset: Offset(1, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInImage(
                height: 160,
                width: 160,
                placeholder: const AssetImage("assets/giphy.gif"),
                image: NetworkImage(product.image),
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  Icon(
                    Icons.star_border_purple500_sharp,
                    color: Theme.of(context).primaryColor,
                    size: 34,
                  ),
                  Text(
                    "${product.rating.rate}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 70),
                  Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: const BoxDecoration(
              color: Color(0xFF668284),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 10),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: Text(
                    "ADD TO CART",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  onPressed: () {
                    cartProvider.addProduct(product);
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          "ADDED PRODUCT",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
