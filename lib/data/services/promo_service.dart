import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../models/promo.dart';

class PromoService {
  Future<List<Promo>> getPromos() async {
    try {
      final url = Uri.parse('$baseUrl/api/promos');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final List<Promo> promos =
            data.map((item) => Promo.fromJson(item)).toList();
        return promos;
      } else {
        throw Exception(
            'Error get promos, status code: ${response.statusCode}');
      }
    } catch (_) {
      return [];
    }
  }
}
