import 'package:get_it/get_it.dart';
import 'package:waroengku/data/data_sources/category/remote_data_source.dart';
import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/data/data_sources/wishlist/remote_data_source.dart';
import 'package:waroengku/data/repositories/category_repository_impl.dart';
import 'package:waroengku/data/repositories/product_repository_impl.dart';
import 'package:waroengku/data/repositories/user_repository_impl.dart';
import 'package:waroengku/data/repositories/wishlist_repository_impl.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/domain/usecases/create_category.dart';
import 'package:waroengku/domain/usecases/create_product.dart';
import 'package:waroengku/domain/usecases/create_wishlist.dart';
import 'package:waroengku/domain/usecases/delete_category.dart';
import 'package:waroengku/domain/usecases/delete_product.dart';
import 'package:waroengku/domain/usecases/delete_wishlist.dart';
import 'package:waroengku/domain/usecases/get_categories.dart';
import 'package:waroengku/domain/usecases/get_product.dart';
import 'package:waroengku/domain/usecases/get_product_by_category.dart';
import 'package:waroengku/domain/usecases/get_user_logged_in.dart';
import 'package:waroengku/domain/usecases/get_wishlist.dart';
import 'package:waroengku/domain/usecases/is_sign_in.dart';
import 'package:waroengku/domain/usecases/login.dart';
import 'package:waroengku/domain/usecases/logout.dart';
import 'package:waroengku/domain/usecases/register.dart';
import 'package:waroengku/domain/usecases/update_category.dart';
import 'package:waroengku/domain/usecases/update_product.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/category/cat_bloc.dart';
import 'package:waroengku/presentation/blocs/product/product_bloc.dart';
import 'package:waroengku/presentation/blocs/wishlist/wish_bloc.dart';

import 'domain/repositories/product_repository.dart';
import 'domain/repositories/wishlist_repository.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  // data source
  getIt.registerSingleton<UserRemoteDataSource>(
    UserRemoteDataSourceImpl(),
  );

  getIt.registerSingleton<CategoryRemoteDataSource>(
    CategoryRemoteDataSourceImpl(),
  );

  getIt.registerSingleton<ProductRemoteDataSource>(
    ProductRemoteDataSourceImpl(),
  );

  getIt.registerSingleton<WishlistRemoteDataSource>(
    WishlistRemoteDataSourceImpl(),
  );

  // repository
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerSingleton<WishlistRepository>(
    WishlistRepositoryImpl(getIt()),
  );

  // usecase
  getIt.registerSingleton<IsSignIn>(
    IsSignIn(),
  );
  getIt.registerSingleton<GetUserLoggedIn>(
    GetUserLoggedIn(),
  );
  getIt.registerSingleton<Register>(
    Register(getIt()),
  );
  getIt.registerSingleton<Login>(
    Login(getIt()),
  );
  getIt.registerSingleton<Logout>(
    Logout(getIt()),
  );

  getIt.registerSingleton<GetCategories>(
    GetCategories(getIt()),
  );

  getIt.registerSingleton<CreateCategory>(
    CreateCategory(getIt()),
  );

  getIt.registerSingleton<UpdateCategory>(
    UpdateCategory(getIt()),
  );

  getIt.registerSingleton<GetProductByCategory>(
    GetProductByCategory(getIt()),
  );

  getIt.registerSingleton<CreateProduct>(
    CreateProduct(getIt()),
  );

  getIt.registerSingleton<UpdateProduct>(
    UpdateProduct(getIt()),
  );

  getIt.registerSingleton<DeleteProduct>(
    DeleteProduct(getIt()),
  );

  getIt.registerSingleton<GetProduct>(
    GetProduct(getIt()),
  );

  getIt.registerSingleton<DeleteCategory>(
    DeleteCategory(getIt()),
  );

  getIt.registerSingleton<DeleteWishlist>(
    DeleteWishlist(getIt()),
  );

  getIt.registerSingleton<CreateWishlist>(
    CreateWishlist(getIt()),
  );

  getIt.registerSingleton<GetWishlist>(
    GetWishlist(getIt()),
  );

  // bloc
  getIt.registerSingleton<WishlistBloc>(
    WishlistBloc(
      getWishlist: getIt(),
      createWishlist: getIt(),
      deleteWishlist: getIt(),
    ),
  );

  getIt.registerSingleton<ProductBloc>(
    ProductBloc(
      getProductByCategory: getIt(),
      createProduct: getIt(),
      updateProduct: getIt(),
      deleteProduct: getIt(),
      getProduct: getIt(),
    ),
  );

  getIt.registerSingleton(
    AuthBloc(
      isSignIn: getIt(),
      getUserLoggedIn: getIt(),
      register: getIt(),
      login: getIt(),
      logout: getIt(),
    ),
  );

  getIt.registerSingleton<CategoryBloc>(
    CategoryBloc(
      getCategories: getIt(),
      createCategory: getIt(),
      updateCategory: getIt(),
      deleteCategory: getIt(),
    ),
  );
}
