import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  final String title;
  final double price;
  final String? description;
  final String image;

  Producto({
    required this.title,
    required this.price,
    this.description,
    required this.image,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
