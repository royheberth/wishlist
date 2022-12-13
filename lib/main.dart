import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/services/services.dart';
import 'package:wishlist/routes/custom_routes.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CustomPreferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductosService()),
        ChangeNotifierProvider(
          create: (_) => TemaService(isDarkMode: CustomPreferences.isDark),
        ),
        ChangeNotifierProvider(
          create: (_) => CarritoService(
            CustomPreferences.listaProductos(),
            CustomPreferences.totalPrecio(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: Provider.of<TemaService>(context).currentTheme,
        routes: CustomRoutes.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: CustomRoutes.initialRoute,
        onGenerateRoute: CustomRoutes.onGenerateRoute,
      );
}
