import 'package:bloc/bloc.dart';
import 'package:waroengku/domain/usecases/get_user_logged_in.dart';
import 'package:waroengku/domain/usecases/is_sign_in.dart';
import 'package:waroengku/domain/usecases/login.dart';
import 'package:waroengku/domain/usecases/logout.dart';
import 'package:waroengku/domain/usecases/register.dart';
import 'package:waroengku/presentation/blocs/auth/auth_event.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignIn isSignIn;
  final GetUserLoggedIn getUserLoggedIn;
  final Register register;
  final Login login;
  final Logout logout;
  AuthBloc({
    required this.isSignIn,
    required this.getUserLoggedIn,
    required this.register,
    required this.login,
    required this.logout,
  }) : super(AuthInit()) {
    on<AuthStart>(
      (event, emit) async {
        try {
          if (isSignIn()) {
            final userLoggedIn = getUserLoggedIn();
            emit(Authenticated(userLoggedIn));
          } else {
            emit(UnAuthenticated());
          }
        } catch (e) {
          emit(UnAuthenticated());
        }
      },
    );
    on<AuthLogin>(
      (event, emit) async {
        final result = await login(
          email: event.email,
          password: event.password,
        );
        result.fold(
          (l) => emit(UnAuthenticated()),
          (r) => emit(Authenticated(r)),
        );
      },
    );
    on<AuthLogout>(
      (event, emit) async {
        final result = await logout(event.token);
        result.fold(
          (l) => emit(UnAuthenticated()),
          (r) => emit(UnAuthenticated()),
        );
      },
    );
    on<AuthRegister>(
      (event, emit) async {
        final result = await register(
          email: event.email,
          name: event.name,
          password: event.password,
          phone: event.phone,
        );
        result.fold(
          (l) => emit(UnAuthenticated()),
          (r) {
            print("Berhasil register");
            emit(UnAuthenticated());
          },
        );
      },
    );
  }
}
