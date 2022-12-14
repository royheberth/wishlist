import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/models/producto.dart';
import 'package:wishlist/services/carrito_service.dart';

class CarritoWidget extends StatelessWidget {
  final Producto producto;
  final int index;

  const CarritoWidget({super.key, required this.producto, required this.index});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      shadows: <Shadow>[
        Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 1)
      ],
    );

    return ListTile(
      leading: Text("${index + 1}", style: textStyle),
      title: Text(producto.title, style: textStyle),
      subtitle: Text(producto.price.toStringAsFixed(2), style: textStyle),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete_forever,
          color: Colors.white,
          shadows: <Shadow>[
            Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 1)
          ],
        ),
        onPressed: () => Provider.of<CarritoService>(context, listen: false)
            .eliminarProducto(index),
      ),
    );
  }
}
