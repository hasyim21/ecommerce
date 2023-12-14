import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderResponse extends Equatable {
  final String token;
  final String redirectUrl;

  const OrderResponse({
    required this.token,
    required this.redirectUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'redirect_url': redirectUrl,
    };
  }

  factory OrderResponse.fromMap(Map<String, dynamic> map) {
    return OrderResponse(
      token: map['token'] ?? '',
      redirectUrl: map['redirect_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderResponse.fromJson(String source) =>
      OrderResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderResponse(token: $token, redirectUrl: $redirectUrl)';

  @override
  List<Object> get props => [token, redirectUrl];
}
