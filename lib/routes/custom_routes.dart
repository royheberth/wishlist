import 'package:flutter/material.dart';
import 'package:wishlist/screens/inicio_screen.dart';
import 'package:wishlist/screens/carrito_screen.dart';

class CustomRoutes {
  static String initialRoute = 'inicio';

  static Map<String, Widget Function(BuildContext)> routes = {
    'inicio': (_) => const InicioScreen(),
    'carrito': (_) => const CarritoScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: (_) => const InicioScreen());
}
