// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/auth.dart';
// import '../models/user.dart';

// class DBService {
//   Future<bool> saveAuthData(Auth model) async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final result = await pref.setString('auth', json.encode(model.toJson()));
//     return result;
//   }

//   Future<bool> removeAuthData() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.remove('auth');
//   }

//   Future<String> getToken() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final authJson = pref.getString('auth') ?? '';
//     final authData = Auth.fromJson(json.decode(authJson));
//     return authData.jwt;
//   }

//   Future<Auth> getAuthData() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final authJson = pref.getString('auth') ?? '';
//     final authData = Auth.fromJson(json.decode(authJson));
//     return authData;
//   }

//   Future<User> getUser() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final authJson = pref.getString('auth') ?? '';
//     final authData = Auth.fromJson(json.decode(authJson));
//     return authData.user;
//   }

//   Future<int> getUserId() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final authJson = pref.getString('auth') ?? '';
//     final authData = Auth.fromJson(json.decode(authJson));
//     return authData.user.id;
//   }

//   Future<bool> isLogin() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final authJson = pref.getString('auth');
//     return authJson != null;
//   }
// }

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DBService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

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
