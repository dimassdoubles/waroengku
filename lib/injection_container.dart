import 'package:get_it/get_it.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/data/repositories/user_repository_impl.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/domain/usecases/get_user_logged_in.dart';
import 'package:waroengku/domain/usecases/is_sign_in.dart';
import 'package:waroengku/domain/usecases/login.dart';
import 'package:waroengku/domain/usecases/logout.dart';
import 'package:waroengku/domain/usecases/register.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  // data source
  getIt.registerSingleton<UserRemoteDataSource>(
    UserRemoteDataSourceImpl(),
  );

  // repository
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(remoteDataSource: getIt()),
  );

  // usecase
  getIt.registerSingleton<IsSignIn>(
    IsSignIn(),
  );
  getIt.registerSingleton<GetUserLoggedIn>(
    GetUserLoggedIn(),
  );
  getIt.registerSingleton<Register>(
    Register(getIt()),
  );
  getIt.registerSingleton<Login>(
    Login(getIt()),
  );
  getIt.registerSingleton<Logout>(
    Logout(getIt()),
  );

  // bloc
  getIt.registerSingleton(
    AuthBloc(
      isSignIn: getIt(),
      getUserLoggedIn: getIt(),
      register: getIt(),
      login: getIt(),
      logout: getIt(),
    ),
  );
}
