import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final Attributes attributes;

  const Product({
    required this.id,
    required this.attributes,
  });

  Product copyWith({
    int? id,
    Attributes? attributes,
  }) =>
      Product(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };

  @override
  String toString() => 'Product(id: $id, attributes: $attributes)';

  @override
  List<Object> get props => [id, attributes];
}

class Attributes extends Equatable {
  final String name;
  final String brand;
  final int price;
  final String? description;
  final List<Size> sizes;
  final List<String> images;

  const Attributes({
    required this.name,
    required this.brand,
    required this.price,
    this.description,
    required this.sizes,
    required this.images,
  });

  Attributes copyWith({
    String? name,
    String? brand,
    int? price,
    String? description,
    List<Size>? sizes,
    List<String>? images,
  }) =>
      Attributes(
        name: name ?? this.name,
        brand: brand ?? this.brand,
        price: price ?? this.price,
        description: description ?? this.description,
        sizes: sizes ?? this.sizes,
        images: images ?? this.images,
      );

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        brand: json["brand"],
        price: json["price"],
        description: json["description"],
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "price": price,
        "description": description,
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
      };

  @override
  String toString() {
    return 'Attributes(name: $name, brand: $brand, price: $price, description: $description, sizes: $sizes, images: $images)';
  }

  @override
  List<Object?> get props {
    return [
      name,
      brand,
      price,
      description,
      sizes,
      images,
    ];
  }
}

class Size extends Equatable {
  final String size;
  final int qty;

  const Size({
    required this.size,
    required this.qty,
  });

  Size copyWith({
    String? size,
    int? qty,
  }) =>
      Size(
        size: size ?? this.size,
        qty: qty ?? this.qty,
      );

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "qty": qty,
      };

  @override
  String toString() => 'Size(size: $size, qty: $qty)';

  @override
  List<Object> get props => [size, qty];
}
