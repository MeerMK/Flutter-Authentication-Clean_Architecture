import 'package:demo_app/features/auth/domain/entities/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> signIn(String email, String password);
  Future<AuthResponse> signUp(String username, String email, String password);
}
