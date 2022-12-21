import 'package:wishlist/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  String _selectedCategory = "all";
  List<ProductModel> products = [];
  List<CategoryModel> categories = [
    CategoryModel(
      name: "all",
      icon: Icons.home_outlined,
    ),
    CategoryModel(
      name: "electronics",
      icon: Icons.access_time_sharp,
    ),
    CategoryModel(
      name: "jewelery",
      icon: Icons.add_chart_outlined,
    ),
    CategoryModel(
      name: "men's clothing",
      icon: Icons.app_settings_alt_outlined,
    ),
    CategoryModel(
      name: "women's clothing",
      icon: Icons.ballot_rounded,
    ),
  ];

  ProductsProvider() {
    getProducts("all");
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    products.clear();
    getProducts(value);
    notifyListeners();
  }

  dynamic getProducts(String category) async {
    final url = (category == "all")
        ? "https://fakestoreapi.com/products"
        : "https://fakestoreapi.com/products/category/$category";
    final response = await http.get(Uri.parse(url));
    products.addAll(productsFromStr(response.body));
    notifyListeners();
  }
}
