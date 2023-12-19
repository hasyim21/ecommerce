import '../models/auth.dart';
import '../models/user.dart';
import '../services/db_service.dart';
import '../services/user_service.dart';

class UserRepository {
  UserService userService;
  DBService dbService;

  UserRepository({
    required this.userService,
    required this.dbService,
  });

  Future<User> getUser() async {
    try {
      final String token = await dbService.getToken();
      final User user = await userService.getUser(token);
      return user;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<User> updateProfile({
    required String fullName,
    required String username,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      final Auth auth = await dbService.getAuthData();
      final User user = await userService.updateProfile(
        id: auth.user.id,
        token: auth.jwt,
        fullName: fullName,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
      );
      return user;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<User> updateAddress({required Address address}) async {
    try {
      final Auth auth = await dbService.getAuthData();
      final User user = await userService.updateAddress(
        id: auth.user.id,
        token: auth.jwt,
        address: address,
      );
      return user;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
