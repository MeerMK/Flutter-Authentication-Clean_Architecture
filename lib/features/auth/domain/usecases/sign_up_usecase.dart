import 'package:dartz/dartz.dart';
import 'package:demo_app/features/auth/domain/entities/auth_response.dart';
import 'package:demo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:demo_app/core/error/failures.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, AuthResponse>> call(
      String username, String email, String password) async {
    try {
      final response = await repository.signUp(username, email, password);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
