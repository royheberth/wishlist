import 'package:wishlist/models/producto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomPreferences {
  static late SharedPreferences _prefs;

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static void guardarProductos(List<Producto> productos) =>
      _prefs.setString("carrito", productoToStr(productos));

  static List<Producto> listaProductos() {
    String? productos = _prefs.getString("carrito");
    List<Producto> productosCarrito =
        (productos != null) ? productoFromJson(productos) : [];
    return productosCarrito;
  }

  static double totalPrecio() {
    List<Producto> productos = listaProductos();
    double total = 0;
    for (Producto producto in productos) {
      total += double.parse(producto.price.toStringAsFixed(2));
    }
    return total;
  }

  /*static String obtenerProductos() => _prefs.getString("carrito") ?? '';

  static void guardarProductos(List<Producto> productos) =>
      _prefs.setString("carrito", productoToStr(productos));

  static void agregarProducto(Producto producto) {
    List<Producto> productosCarrito = listaProductos();
    productosCarrito.add(producto);
    guardarProductos(productosCarrito);
  }*/
}
