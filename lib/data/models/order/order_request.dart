import 'package:equatable/equatable.dart';

import '../product.dart';
import '../user.dart';

class OrderRequest extends Equatable {
  final Data data;

  const OrderRequest({
    required this.data,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'OrderRequest(data: $data)';
}

class Data extends Equatable {
  final User user;
  final List<Product> products;
  final int totalPrice;
  final int shippingCosts;
  final int totalPayment;
  final String status;
  final int userId;

  const Data({
    required this.user,
    required this.products,
    required this.totalPrice,
    required this.shippingCosts,
    required this.totalPayment,
    required this.status,
    required this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        totalPrice: json["totalPrice"],
        shippingCosts: json["shippingCosts"],
        totalPayment: json["totalPayment"],
        status: json["status"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "shippingCosts": shippingCosts,
        "totalPayment": totalPayment,
        "status": status,
        "userId": userId,
      };

  @override
  List<Object> get props {
    return [
      user,
      products,
      totalPrice,
      shippingCosts,
      totalPayment,
      status,
      userId,
    ];
  }

  @override
  String toString() {
    return 'Data(user: $user, products: $products, totalPrice: $totalPrice, shippingCosts: $shippingCosts, totalPayment: $totalPayment, status: $status, userId: $userId)';
  }
}
