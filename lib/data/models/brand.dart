import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final int id;
  final Attributes attributes;

  const Brand({
    required this.id,
    required this.attributes,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };

  @override
  List<Object> get props => [id, attributes];

  @override
  String toString() => 'Brand(id: $id, attributes: $attributes)';
}

class Attributes extends Equatable {
  final String name;
  final String image;

  const Attributes({
    required this.name,
    required this.image,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };

  @override
  List<Object> get props => [name, image];

  @override
  String toString() => 'Attributes(name: $name, image: $image)';
}
