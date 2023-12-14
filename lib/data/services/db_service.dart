import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/auth.dart';

class DBService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> saveAuthData(Auth auth) async {
    await storage.write(key: 'auth', value: json.encode(auth.toJson()));
  }

  Future<Auth> getAuthData() async {
    final authJson = await storage.read(key: 'auth') ?? '';
    final authData = Auth.fromJson(json.decode(authJson));
    return authData;
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String> getToken() async {
    final token = await storage.read(key: 'token');
    return token ?? '';
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    await storage.write(key: 'user', value: json.encode(user));
  }

  Future<Map<String, dynamic>?> getUser() async {
    final userString = await storage.read(key: 'user');
    if (userString != null && userString.isNotEmpty) {
      final user = json.decode(userString) as Map<String, dynamic>;
      return user;
    }
    return null;
  }
}
