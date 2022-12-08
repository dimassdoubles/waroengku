import 'package:bloc/bloc.dart';
import '../../../domain/usecases/create_transaction.dart';
import '../../../domain/usecases/get_transaction.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

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
            emit(TransactionFail());
          },
          (r) {
            emit(TransactionSuccess());
          },
        );
      },
    );
  }
}
