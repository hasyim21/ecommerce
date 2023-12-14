import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../models/auth.dart';
import '../models/my_app_error.dart';

class AuthService {
  Future<Auth> doLogin({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/local');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'identifier': email,
        'password': password,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Auth.fromJson(data);
    } else {
      throw MyAppError('${data['error']['message']}');
    }
  }

  Future<Auth> doRegister({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/local/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Auth.fromJson(data);
    } else {
      throw MyAppError('${data['error']['message']}');
    }
  }
}
