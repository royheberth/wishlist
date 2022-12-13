import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToStr(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  final String title;
  final String image;
  final double price;
  final String? description;

  Producto({
    required this.title,
    required this.image,
    required this.price,
    this.description,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        title: json["title"],
        image: json["image"],
        price: json["price"].toDouble(),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "price": price,
        "description": description,
      };
}
