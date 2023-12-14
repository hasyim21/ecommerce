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
}
