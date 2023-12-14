import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../models/product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      final url = Uri.parse('$baseUrl/api/products');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final List<Product> products =
            data.map((item) => Product.fromJson(item)).toList();
        return products;
      } else {
        throw Exception(
            'Error get products, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Product>> getProductsByBrand(String category) async {
    try {
      final url =
          Uri.parse('$baseUrl/api/products?filters[brand][\$eq]=$category');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final List<Product> productsByBrand =
            data.map((item) => Product.fromJson(item)).toList();
        return productsByBrand;
      } else {
        throw Exception(
            'Error get products, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
