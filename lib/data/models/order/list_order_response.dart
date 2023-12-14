class ListOrderResponse {
  List<Order>? data;

  ListOrderResponse({
    this.data,
  });

  factory ListOrderResponse.fromJson(Map<String, dynamic> json) =>
      ListOrderResponse(
        data: json["data"] == null
            ? []
            : List<Order>.from(json["data"]!.map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Order {
  int? id;
  OrderAttributes? attributes;

  Order({
    this.id,
    this.attributes,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : OrderAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class OrderAttributes {
  OrderUser? user;
  int? shippingCosts;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  int? totalPrice;
  int? totalPayment;
  List<OrderProduct>? products;

  OrderAttributes({
    this.user,
    this.shippingCosts,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.totalPrice,
    this.totalPayment,
    this.products,
  });

  factory OrderAttributes.fromJson(Map<String, dynamic> json) =>
      OrderAttributes(
        user: json["user"] == null ? null : OrderUser.fromJson(json["user"]),
        shippingCosts: json["shippingCosts"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        totalPrice: json["totalPrice"],
        totalPayment: json["totalPayment"],
        products: json["products"] == null
            ? []
            : List<OrderProduct>.from(
                json["products"]!.map((x) => OrderProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "shippingCosts": shippingCosts,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "totalPrice": totalPrice,
        "totalPayment": totalPayment,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class OrderProduct {
  int? id;
  ProductAttributes? attributes;

  OrderProduct({
    this.id,
    this.attributes,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : ProductAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class ProductAttributes {
  String? name;
  String? brand;
  int? price;
  String? description;
  List<OrderSize>? sizes;
  List<String>? images;

  ProductAttributes({
    this.name,
    this.brand,
    this.price,
    this.description,
    this.sizes,
    this.images,
  });

  factory ProductAttributes.fromJson(Map<String, dynamic> json) =>
      ProductAttributes(
        name: json["name"],
        brand: json["brand"],
        price: json["price"],
        description: json["description"],
        sizes: json["sizes"] == null
            ? []
            : List<OrderSize>.from(
                json["sizes"]!.map((x) => OrderSize.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "price": price,
        "description": description,
        "sizes": sizes == null
            ? []
            : List<dynamic>.from(sizes!.map((x) => x.toJson())),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class OrderSize {
  String? size;
  int? qty;

  OrderSize({
    this.size,
    this.qty,
  });

  factory OrderSize.fromJson(Map<String, dynamic> json) => OrderSize(
        size: json["size"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "qty": qty,
      };
}

class OrderUser {
  int? id;
  String? username;
  String? email;
  String? name;
  String? phoneNumber;
  OrderAddress? address;

  OrderUser({
    this.id,
    this.username,
    this.email,
    this.name,
    this.phoneNumber,
    this.address,
  });

  factory OrderUser.fromJson(Map<String, dynamic> json) => OrderUser(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        address: json["address"] == null
            ? null
            : OrderAddress.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "phoneNumber": phoneNumber,
        "address": address?.toJson(),
      };
}

class OrderAddress {
  String? fullName;
  String? phoneNumber;
  String? street;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? otherDetails;

  OrderAddress({
    this.fullName,
    this.phoneNumber,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.otherDetails,
  });

  factory OrderAddress.fromJson(Map<String, dynamic> json) => OrderAddress(
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
        otherDetails: json["otherDetails"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "street": street,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "otherDetails": otherDetails,
      };
}
