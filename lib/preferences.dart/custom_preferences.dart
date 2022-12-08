import 'package:wishlist/models/producto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomPreferences {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String obtenerProductos() {
    return _prefs.getString("carrito") ?? '';
  }

  static void agregarProductos(Producto producto) {
    List<Producto> productosCarrito = [];
    String? productos = _prefs.getString("carrito");
    if (productos != null) {
      productosCarrito = productoFromJson(productos);
    }
    productosCarrito.add(
      Producto(
        title: producto.title,
        price: producto.price,
        image: producto.image,
      ),
    );
    _prefs.setString("carrito", productoToJson(productosCarrito));
  }
}
