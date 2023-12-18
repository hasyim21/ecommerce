import 'package:equatable/equatable.dart';

import '../product.dart';
import '../user.dart';

class Order extends Equatable {
  final int id;
  final OrderAttributes attributes;

  const Order({
    required this.id,
    required this.attributes,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        attributes: OrderAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };

  @override
  List<Object> get props => [id, attributes];

  @override
  String toString() => 'Order(id: $id, attributes: $attributes)';
}

class OrderAttributes extends Equatable {
  final User user;
  final int shippingCosts;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final int totalPrice;
  final int totalPayment;
  final List<Product> products;
  final int userId;

  const OrderAttributes({
    required this.user,
    required this.shippingCosts,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.totalPrice,
    required this.totalPayment,
    required this.products,
    required this.userId,
  });

  factory OrderAttributes.fromJson(Map<String, dynamic> json) =>
      OrderAttributes(
        user: User.fromJson(json["user"]),
        shippingCosts: json["shippingCosts"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        totalPrice: json["totalPrice"],
        totalPayment: json["totalPayment"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "shippingCosts": shippingCosts,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "totalPrice": totalPrice,
        "totalPayment": totalPayment,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "userId": userId,
      };

  @override
  List<Object> get props {
    return [
      user,
      shippingCosts,
      status,
      createdAt,
      updatedAt,
      publishedAt,
      totalPrice,
      totalPayment,
      products,
      userId,
    ];
  }

  @override
  String toString() {
    return 'OrderAttributes(user: $user, shippingCosts: $shippingCosts, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, totalPrice: $totalPrice, totalPayment: $totalPayment, products: $products, userId: $userId)';
  }
}
