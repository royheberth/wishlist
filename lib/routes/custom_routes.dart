import 'package:wishlist/pages/pages.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static String initialRoute = "home";

  static Map<String, Widget Function(BuildContext)> routes = {
    "product": (_) => const ProductListPage(),
    "cart": (_) => const ShoppingCartPage(),
    "setting": (_) => const SettingPage(),
    "home": (_) => const HomePage(),
  };

  static Route? onGenerateRoutes(RouteSettings settings) => MaterialPageRoute(
        builder: (_) => const HomePage(),
      );
}
