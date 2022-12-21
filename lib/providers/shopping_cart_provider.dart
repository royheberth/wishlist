import 'package:wishlist/preferences/custom_preferences.dart';
import 'package:wishlist/models/product_model.dart';
import 'package:flutter/material.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<ProductModel> products;
  double total;

  ShoppingCartProvider()
      : products = CustomPreferences.productsList(),
        total = CustomPreferences.totalPrice();

  void addProduct(ProductModel product) {
    total += product.price;
    total = total.abs();
    products.add(product);
    CustomPreferences.saveProducts(products);
    notifyListeners();
  }

  void deleteProduct(int index) {
    total -= products[index].price;
    total = total.abs();
    products.removeAt(index);
    CustomPreferences.saveProducts(products);
    notifyListeners();
  }

  void saveCart() {
    CustomPreferences.deleteProducts();
    products.clear();
    total = 0;
    notifyListeners();
  }
}
