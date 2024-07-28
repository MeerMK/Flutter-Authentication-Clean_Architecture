import 'package:demo_app/features/auth/data/datasources/remote_auth_datasource.dart';
import 'package:demo_app/features/auth/domain/entities/auth_response.dart';
import 'package:demo_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthResponse> signIn(String email, String password) async {
    return await remoteDataSource.signIn(email, password);
  }

  @override
  Future<AuthResponse> signUp(
      String username, String email, String password) async {
    return await remoteDataSource.signUp(username, email, password);
  }
}
