import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishlist/models/models.dart';

class CustomPreferences {
  static late SharedPreferences _prefs;
  static bool _isDarkMode = false;

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static bool get isDark => _prefs.getBool("isDark") ?? _isDarkMode;

  static set isDark(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _prefs.setBool("isDark", isDarkMode);
  }

  static void saveProducts(List<ProductModel> products) =>
      _prefs.setString("cart", productsToStr(products));

  static List<ProductModel> productsList() {
    String? products = _prefs.getString("cart");
    List<ProductModel> cartProducts =
        (products != null) ? productsFromStr(products) : [];
    return cartProducts;
  }

  static double totalPrice() {
    List<ProductModel> products = productsList();
    double total = 0;
    for (ProductModel product in products) {
      total += double.parse(product.price.toStringAsFixed(2));
    }
    return total;
  }

  static void deleteProducts() => _prefs.remove("cart");
}
