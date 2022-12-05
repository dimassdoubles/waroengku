import 'package:waroengku/domain/entity/user.dart';

class GetUserLoggedIn {
  User call() {
    return const User(
      id: 133,
      name: "kelompok1tidaklogout",
      email: "kelompok1tidaklogout@gmail.com",
      phone: "948729437123",
      role: "user",
      token: "1863|fZeGw7F1nMQHOgsxDtqC8S8MgUffg4uXj3GcihbV",
    );
  }
}
