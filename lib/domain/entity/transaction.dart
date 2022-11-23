import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/detail_transaction.dart';

class Transaction extends Equatable {
  final int _id, _total, _userId;
  final String _status, _address;
  final List<DetailTransaction> _detailTransactions;

  const Transaction({
    required int id,
    required int total,
    required int userId,
    required String status,
    required String address,
    required List<DetailTransaction> detailTransactions,
  })  : _id = id,
        _total = total,
        _userId = userId,
        _status = status,
        _address = address,
        _detailTransactions = detailTransactions;

  @override
  List<Object?> get props => [
        _id,
        _userId,
        _total,
        _status,
        _address,
        _detailTransactions,
      ];

  List<DetailTransaction> get detailTransactions {
    return _detailTransactions;
  }

  String get address {
    return _address;
  }

  String get status {
    return _status;
  }

  int get total {
    return _total;
  }

  int get userId {
    return _userId;
  }

  int get id {
    return _id;
  }
}
