abstract class CategoryEvent {}

class CategoryGet extends CategoryEvent {
  String token;
  CategoryGet(this.token);
}

class CategoryCreate extends CategoryEvent {
  String name, token;
  CategoryCreate({
    required this.token,
    required this.name,
  });
}

class CategoryDelete extends CategoryEvent {
  String token;
  int id;
  CategoryDelete({
    required this.token,
    required this.id,
  });
}

class CategoryEdit extends CategoryEvent {
  String token, newName;
  int id;
  CategoryEdit({
    required this.token,
    required this.id,
    required this.newName,
  });
}
