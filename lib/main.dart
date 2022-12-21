import 'package:wishlist/preferences/custom_preferences.dart';
import 'package:wishlist/routes/custom_routes.dart';
import 'package:wishlist/providers/providers.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomPreferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationMenuProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Wish list APP',
        routes: CustomRoutes.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: CustomRoutes.initialRoute,
        onGenerateRoute: CustomRoutes.onGenerateRoutes,
        theme: Provider.of<ThemeProvider>(context).currentTheme,
      );
}
