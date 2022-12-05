import 'package:bloc/bloc.dart';
import 'package:waroengku/domain/usecases/create_product.dart';
import 'package:waroengku/domain/usecases/delete_product.dart';
import 'package:waroengku/domain/usecases/get_product.dart';
import 'package:waroengku/domain/usecases/get_product_by_category.dart';
import 'package:waroengku/domain/usecases/update_product.dart';
import 'package:waroengku/presentation/blocs/product/product_event.dart';
import 'package:waroengku/presentation/blocs/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductByCategory getProductByCategory;
  GetProduct getProduct;
  CreateProduct createProduct;
  UpdateProduct updateProduct;
  DeleteProduct deleteProduct;
  ProductBloc({
    required this.getProductByCategory,
    required this.getProduct,
    required this.createProduct,
    required this.updateProduct,
    required this.deleteProduct,
  }) : super(ProductUnload()) {
    on<ProductCreate>(
      (event, emit) async {
        emit(ProductOnload());
        print("mencoba membuat produk baru");
        final result = await createProduct(
          categoryId: event.categoryId,
          description: event.description,
          image: event.image,
          name: event.name,
          price: event.price,
          stock: event.stock,
          token: event.token,
        );
        print("selesai membuat produk");
        result.fold(
          (l) => emit(ProductUnload()),
          (r) => emit(ProductUnload()),
        );
        // final result = await getProduct
      },
    );
    on<ProductGet>(
      (event, emit) async {
        emit(ProductOnload());
        print("mencoba mengambil produk");
        final result = await getProduct(event.token, event.categories);
        print("mengambil produk selesai");
        result.fold(
          (l) => emit(ProductUnload()),
          (r) => emit(ProductLoaded(r)),
        );
      },
    );
  }
}
