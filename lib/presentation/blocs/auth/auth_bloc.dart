import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_user_logged_in.dart';
import '../../../domain/usecases/is_sign_in.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/logout.dart';
import '../../../domain/usecases/register.dart';
import 'auth_event.dart';
import 'auth_state.dart';

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
        emit(AuthLoad());
        final result = await login(
          email: event.email,
          password: event.password,
        );
        result.fold(
          (l) {
            return emit(AuthFail());
          },
          (r) => emit(Authenticated(r)),
        );
      },
    );
    on<AuthLogout>(
      (event, emit) async {
        emit(AuthLoad());
        final result = await logout(event.token);
        result.fold(
          (l) => emit(UnAuthenticated()),
          (r) => emit(UnAuthenticated()),
        );
      },
    );
    on<AuthRegister>(
      (event, emit) async {
        emit(AuthLoad());
        await register(
          email: event.email,
          name: event.name,
          password: event.password,
          phone: event.phone,
        );

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
  }
}
