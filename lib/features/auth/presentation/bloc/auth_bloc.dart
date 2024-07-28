import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:demo_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:demo_app/features/auth/domain/entities/auth_response.dart';
import 'package:demo_app/core/error/failures.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  SignUpEvent(
      {required this.username, required this.email, required this.password});
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthResponse authResponse;

  AuthSuccess(this.authResponse);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.signInUseCase, this.signUpUseCase) : super(AuthInitial());

  @override
  // ignore: override_on_non_overriding_member
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInEvent) {
      yield AuthLoading();
      final result = await signInUseCase(event.email, event.password);
      yield result.fold(
        (failure) => AuthFailure(_mapFailureToMessage(failure)),
        (authResponse) => AuthSuccess(authResponse),
      );
    } else if (event is SignUpEvent) {
      yield AuthLoading();
      final result =
          await signUpUseCase(event.username, event.email, event.password);
      yield result.fold(
        (failure) => AuthFailure(_mapFailureToMessage(failure)),
        (authResponse) => AuthSuccess(authResponse),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    // Handle different failure types and map them to user-friendly messages
    return 'An unexpected error occurred';
  }
}
