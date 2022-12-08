import 'package:equatable/equatable.dart';

import '../../../domain/entity/transaction.dart';

abstract class TransactionState extends Equatable {}

class TransactionUnload extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionOnload extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions;
  TransactionLoaded({required this.transactions});
  @override
  List<Object?> get props => [transactions];
}

class TransactionSuccess extends TransactionState {
  @override
  List<Object?> get props => [];
}
class TransactionFail extends TransactionState {
  @override
  List<Object?> get props => [];
}
