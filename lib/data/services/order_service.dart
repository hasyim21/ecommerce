import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../models/order/order_request.dart';
import '../models/order/order_response.dart';

class OrderService {
  Future<OrderResponse> createOrder(
      OrderRequest orderRequest, String token) async {
    try {
      final url = Uri.parse('$baseUrl/api/orders');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(orderRequest.toJson()),
      );

      if (response.statusCode == 200) {
        return OrderResponse.fromJson(response.body);
      } else {
        throw Exception('Order error, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
