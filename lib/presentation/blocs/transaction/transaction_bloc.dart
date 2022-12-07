import 'package:bloc/bloc.dart';
import 'package:waroengku/domain/usecases/create_transaction.dart';
import 'package:waroengku/domain/usecases/get_transaction.dart';
import 'package:waroengku/presentation/blocs/transaction/transaction_event.dart';
import 'package:waroengku/presentation/blocs/transaction/transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  CreateTransaction createTransaction;
  GetTransaction getTransaction;
  TransactionBloc({
    required this.createTransaction,
    required this.getTransaction,
  }) : super(TransactionUnload()) {
    on<TransactionGet>(
      (event, emit) async {
        emit(TransactionOnload());
        final result = await getTransaction(event.token);
        result.fold(
          (l) => emit(TransactionUnload()),
          (r) => emit(TransactionLoaded(transactions: r)),
        );
      },
    );
    on<TransactionCreate>(
      (event, emit) async {
        emit(TransactionOnload());
        final result = await createTransaction(event.token, event.address);
        result.fold(
          (l) {
            print("transaksi gagal");
            emit(TransactionFail());
          },
          (r) {
            print("transaksi berhasil");
            emit(TransactionSuccess());
          },
        );
      },
    );
  }
}
