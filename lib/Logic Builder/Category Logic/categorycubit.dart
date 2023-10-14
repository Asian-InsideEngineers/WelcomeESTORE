import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/categories.dart';
import 'package:welcomestoreapp/Data%20Management/Repository/categoryrepository.dart';
import 'package:welcomestoreapp/Logic%20Builder/Category%20Logic/categorystate.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState()) {
    categoryinitialization();
  }
  final _categoryRepository = CategoryRepository();

  void categoryinitialization() async {
    emit(CategoryLoadingState(state.categories));
    try {
      List<CategoryModel> newcategories =
          await _categoryRepository.fetchAllCategories();
      emit(CategoryLoadedState(newcategories));
    } catch (error) {
      emit(CategoryErrorState(error.toString(), state.categories));
    }
  }
}
