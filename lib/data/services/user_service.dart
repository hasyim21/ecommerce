import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../models/user.dart';

class UserService {
  Future<User> getUser(String token) async {
    try {
      final url = Uri.parse('$baseUrl/api/users/me');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        throw Exception('Order error, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<User> updateProfile({
    required int id,
    required String token,
    required String fullName,
    required String username,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/users/$id');
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'fullName': fullName,
          'username': username,
          'email': email,
          'phoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final User updatedUser = User.fromJson(data);
        return updatedUser;
      } else {
        throw Exception('Update error, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<User> updateAddress({
    required int id,
    required String token,
    required Address address,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/users/$id');
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'address': address.toJson()}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final User updatedUser = User.fromJson(data);
        return updatedUser;
      } else {
        throw Exception('Update error, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
