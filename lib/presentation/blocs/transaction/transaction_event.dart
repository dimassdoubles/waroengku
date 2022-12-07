abstract class TransactionEvent {}

class TransactionGet extends TransactionEvent {
  String token;
  TransactionGet({required this.token});
}

class TransactionCreate extends TransactionEvent {
  String token, address;
  TransactionCreate({
    required this.token,
    required this.address,
  });
}
