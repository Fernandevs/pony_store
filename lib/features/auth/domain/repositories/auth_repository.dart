import 'package:pony_store/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);

  Future<User> register(String email, String password, String fullName);

  Future<User> checkAuthStatus(String token);
}
