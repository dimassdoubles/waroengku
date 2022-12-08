import 'package:bloc/bloc.dart';
import '../../../domain/usecases/create_product.dart';
import '../../../domain/usecases/delete_product.dart';
import '../../../domain/usecases/get_product.dart';
import '../../../domain/usecases/get_product_by_category.dart';
import '../../../domain/usecases/update_product.dart';
import 'product_event.dart';
import 'product_state.dart';

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
        final result = await createProduct(
          categoryId: event.categoryId,
          description: event.description,
          image: event.image,
          name: event.name,
          price: event.price,
          stock: event.stock,
          token: event.token,
        );
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
        final result =
            await getProduct(token: event.token, categories: event.categories,);
        result.fold(
          (l) => emit(ProductUnload()),
          (r) => emit(ProductLoaded(r)),
        );
      },
    );

    on<ProductDelete>(
      (event, emit) async {
        emit(ProductOnload());
        await deleteProduct(token: event.token, id: event.id);
        final result = await getProduct(
          token: event.token,
          categories: event.categories,
        );
        result.fold(
          (l) => emit(ProductUnload()),
          (r) => emit(ProductLoaded(r)),
        );
      },
    );
    on<ProductEdit>(
      (event, emit) async {
        emit(ProductOnload());
        await updateProduct(
          categoryId: event.categoryId,
          description: event.description,
          id: event.id,
          image: event.image,
          name: event.name,
          price: event.price,
          stock: event.stock,
          token: event.token,
        );

        final result = await getProduct(
          token: event.token,
          categories: event.categories,
        );

        result.fold(
          (l) => emit(ProductUnload()),
          (r) => emit(ProductLoaded(r)),
        );
      },
    );
  }
}
