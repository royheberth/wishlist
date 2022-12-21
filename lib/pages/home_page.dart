import 'package:wishlist/providers/providers.dart';
import 'package:wishlist/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationMenuProvider menuProvider =
        Provider.of<NavigationMenuProvider>(context);
    final ShoppingCartProvider cartProvider =
        Provider.of<ShoppingCartProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: menuProvider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [ProductListPage(), SettingPage()],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'cart'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${cartProvider.products.length}"),
            const Icon(Icons.shopping_cart),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => menuProvider.currentPage = value,
        currentIndex: menuProvider.currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
