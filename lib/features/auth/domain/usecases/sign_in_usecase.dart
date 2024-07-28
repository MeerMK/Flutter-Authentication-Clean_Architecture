import 'package:dartz/dartz.dart';
import 'package:demo_app/features/auth/domain/entities/auth_response.dart';
import 'package:demo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:demo_app/core/error/failures.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, AuthResponse>> call(
      String email, String password) async {
    try {
      final response = await repository.signIn(email, password);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
