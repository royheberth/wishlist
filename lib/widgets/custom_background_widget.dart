import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/services/services.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

class CustomBackgroundWidget extends StatelessWidget {
  final Widget child;
  final bool isHome;

  const CustomBackgroundWidget({
    super.key,
    required this.child,
    required this.isHome,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).backgroundColor,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                isHome ? const MenuSuperiorHome() : const MenuSuperiorCarrito(),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      );
}

class MenuSuperiorCarrito extends StatelessWidget {
  const MenuSuperiorCarrito({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 0),
              blurRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.chevron_left_sharp,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "DETAILS",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 18,
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "\$ ${context.watch<CarritoService>().total.toStringAsFixed(2)}",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 10),
          ],
        ),
      );
}

class MenuSuperiorHome extends StatelessWidget {
  const MenuSuperiorHome({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 0),
              blurRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.snowboarding,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 5),
            Text(
              "WISH LIST",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 18,
              ),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'carrito'),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      "\$ ${context.watch<CarritoService>().total.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.shopping_cart_checkout_sharp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Switch.adaptive(
              activeColor: Colors.white54,
              value: CustomPreferences.isDark,
              onChanged: (bool valor) => valor
                  ? context.read<TemaService>().setDarkMode()
                  : context.read<TemaService>().setLightMode(),
            ),
          ],
        ),
      );
}
