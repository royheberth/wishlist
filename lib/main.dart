import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/theme/tema.dart';
import 'package:wishlist/screens/home_screen.dart';
import 'package:wishlist/services/productos_service.dart';

void main() => runApp(const MyApp());

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
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        title: 'Whishlist APP',
        theme: tema,
      ),
    );
  }
}
