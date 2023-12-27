import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final Attributes attributes;

  const Promo({
    required this.id,
    required this.attributes,
  });

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
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
  String toString() => 'Promo(id: $id, attributes: $attributes)';
}

class Attributes extends Equatable {
  final String image;

  const Attributes({
    required this.image,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };

  @override
  List<Object> get props => [image];

  @override
  String toString() => 'Attributes(image: $image)';
}
