import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/themes/custom_dark.dart';
import 'package:wishlist/routes/custom_routes.dart';
import 'package:wishlist/services/productos_service.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CustomPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductosService(),
        ),
      ],
      child: MaterialApp(
        theme: tema,
        routes: CustomRoutes.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: CustomRoutes.initialRoute,
        onGenerateRoute: CustomRoutes.onGenerateRoute,
      ),
    );
  }
}
