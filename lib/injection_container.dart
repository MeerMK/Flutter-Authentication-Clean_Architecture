import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/auth/data/datasources/remote_auth_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/sign_in_usecase.dart';
import 'features/auth/domain/usecases/sign_up_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl()));

  // External dependencies
  sl.registerLazySingleton(() => http.Client());
}
