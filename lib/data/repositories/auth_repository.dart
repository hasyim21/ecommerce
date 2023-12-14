import '../models/auth.dart';
import '../services/auth_service.dart';
import '../services/db_service.dart';

class AuthRepository {
  final AuthService authService;
  final DBService dbService;

  AuthRepository({
    required this.authService,
    required this.dbService,
  });

  Future<Auth> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      final Auth authLogin = await authService.doLogin(
        email: email,
        password: password,
      );

      await dbService.saveAuthData(authLogin);

      return authLogin;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Auth> doRegister({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final Auth authRegister = await authService.doRegister(
        username: username,
        email: email,
        password: password,
      );

      await dbService.saveAuthData(authRegister);

      return authRegister;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> saveToken(String token) async {
    await dbService.saveToken(token);
  }

  Future<bool> hasToken() async {
    bool value = await dbService.hasToken();
    return value;
  }

  Future<void> deleteToken() async {
    await dbService.deleteToken();
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    await dbService.saveUser(user);
  }

  Future<Map<String, dynamic>?> getUser() async {
    final user = await dbService.getUser();
    return user;
  }
}
