import 'package:bloc/bloc.dart';
import '../../../domain/usecases/create_category.dart';
import '../../../domain/usecases/delete_category.dart';
import '../../../domain/usecases/get_categories.dart';
import '../../../domain/usecases/update_category.dart';
import 'cat_event.dart';
import 'cat_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategories getCategories;
  CreateCategory createCategory;
  UpdateCategory updateCategory;
  DeleteCategory deleteCategory;

  CategoryBloc({
    required this.getCategories,
    required this.createCategory,
    required this.updateCategory,
    required this.deleteCategory,
  }) : super(CategoryUnload()) {
    on<CategoryGet>(
      (event, emit) async {
        emit(CategoryOnload());
        final result = await getCategories(event.token);
        result.fold(
          (l) => emit(CategoryUnload()),
          (r) => emit(CategoryLoaded(r)),
        );
      },
    );
    on<CategoryCreate>(
      (event, emit) async {
        emit(CategoryOnload());
        await createCategory(
          name: event.name,
          token: event.token,
        );
        final result = await getCategories(event.token);
        result.fold(
          (l) => emit(CategoryUnload()),
          (r) => emit(CategoryLoaded(r)),
        );
      },
    );
    on<CategoryEdit>(
      (event, emit) async {
        emit(CategoryOnload());
        await updateCategory(
          newName: event.newName,
          id: event.id,
          token: event.token,
        );
        final result = await getCategories(event.token);
        result.fold(
          (l) => emit(CategoryUnload()),
          (r) => emit(CategoryLoaded(r)),
        );
      },
    );
    on<CategoryDelete>(
      (event, emit) async {
        emit(CategoryOnload());
        await deleteCategory(token: event.token, id: event.id);
        final result = await getCategories(event.token);
        result.fold(
          (l) => emit(CategoryUnload()),
          (r) => emit(CategoryLoaded(r)),
        );
      },
    );
  }
}
