import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/widgets/widgets.dart';
import 'package:wishlist/services/services.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomBackgroundWidget(
          isHome: false,
          child: Column(
            children: <Widget>[
              Expanded(
                child: context.watch<CarritoService>().productos.isEmpty
                    ? const Center(
                        child: Text(
                          "THERE ARE NO PRODUCTS ADDED TO THE WISH LIST",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 24,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 1,
                              )
                            ],
                          ),
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount:
                            context.watch<CarritoService>().productos.length,
                        itemBuilder: (_, int index) => CarritoWidget(
                          producto:
                              context.read<CarritoService>().productos[index],
                          index: index,
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).splashColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                ),
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 18,
                    shadows: <Shadow>[
                      Shadow(color: Colors.black, offset: Offset(1, 1)),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
}
