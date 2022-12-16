import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/models/producto.dart';
import 'package:wishlist/services/services.dart';

class CarritoWidget extends StatelessWidget {
  final Producto producto;
  final int index;

  const CarritoWidget({
    super.key,
    required this.producto,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: Colors.white,
      shadows: <Shadow>[
        Shadow(
          color: Colors.black,
          offset: Offset(1, 1),
          blurRadius: 1,
        )
      ],
    );

    return ListTile(
      leading: Text("${index + 1}", style: textStyle),
      title: Text(producto.title, style: textStyle),
      subtitle: Text(
        "\$ ${producto.price.toStringAsFixed(2)}",
        style: textStyle,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete_forever,
          color: Colors.white60,
          shadows: <Shadow>[
            Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 1),
          ],
        ),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => AlertDialog(
              content: const Text("ARE YOU SURE?"),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(color: Color(0xFF587763)),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Color(0xFF272A32)),
                  ),
                  onPressed: () {
                    context.read<CarritoService>().eliminarProducto(index);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
