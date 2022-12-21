import 'package:wishlist/providers/providers.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingCartProvider cartprovider =
        context.watch<ShoppingCartProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "TOTAL: \$ ${cartprovider.total.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 10),
            cartprovider.products.isEmpty
                ? Center(
                    child: Text(
                      "NO DATA",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: cartprovider.products.length,
                      itemBuilder: (_, int index) => ListTile(
                        subtitle: Text(
                          cartprovider.products[index].description,
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.justify,
                        ),
                        title: Text(
                          cartprovider.products[index].title,
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                        leading: Text("${index + 1}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  "ARE YOU SURE?",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      cartprovider.deleteProduct(index);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cartprovider.products.isEmpty
            ? null
            : () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "SAVED SUCCESSFULLY",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
                cartprovider.saveCart();
              },
        child: const Icon(Icons.save),
      ),
    );
  }
}
