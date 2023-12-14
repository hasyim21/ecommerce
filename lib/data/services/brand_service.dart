import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../models/brand.dart';

class BrandService {
  Future<List<Brand>> getBrands() async {
    try {
      final url = Uri.parse('$baseUrl/api/brands');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final List<Brand> brands =
            data.map((item) => Brand.fromJson(item)).toList();
        return brands;
      } else {
        throw Exception(
            'Error get brands, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
