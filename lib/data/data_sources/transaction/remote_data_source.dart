import 'package:dio/dio.dart';
import 'package:waroengku/domain/entity/detail_transaction.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/domain/entity/transaction.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class TransactionRemoteDataSource {
  Future<List<Transaction>> getTransaction(String token);
  Future<void> createTransaction(String token, String address);
}

class TransactionRemoteDataSourceImpl extends TransactionRemoteDataSource {
  @override
  Future<List<Transaction>> getTransaction(String token) async {
    const String endPoint = "$baseUrl/api/transaksi";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(endPoint);
      final datas = response.data["data"];
      List<Transaction> listTransaction = [];
      for (int i = 0; i < datas.length; i++) {
        List<DetailTransaction> detailTransactions = [];
        for (int j = 0; j < datas[i]["products"].length; j++) {
          final pivot = datas[i]["products"][j]["pivot"];
          detailTransactions.add(
            DetailTransaction(
                product: Product(
                  categoryId: datas[i]["products"][j]["category_id"],
                  description: datas[i]["products"][j]["deskripsi"],
                  id: datas[i]["products"][j]["id"],
                  image: datas[i]["products"][j]["image"],
                  name: datas[i]["products"][j]["name"],
                  price: datas[i]["products"][j]["harga"],
                  stock: datas[i]["products"][j]["stock"],
                ), quantity: pivot["qty"],),
          );
        }
        listTransaction.add(
          Transaction(
            id: datas[i]["id"],
            total: datas[i]["total"],
            userId: datas[i]["user_id"],
            status: datas[i]["status"],
            address: datas[i]["alamat"],
            detailTransactions: detailTransactions,
          ),
        );
      }

      return listTransaction;
    } catch (e) {
      throw GetTransactionException("Gagal Mengambil List Transaction");
    }
  }

  @override
  Future<void> createTransaction(String token, String address) async {
    const String endPoint = "$baseUrl/api/transaksi";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final body = {"alamat": address};
      await dio.post(endPoint, data: body);
    } catch (e) {
      throw CreateTransactionException("Gagal Checkout");
    }
  }
}
