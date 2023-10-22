import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/categories.dart';
import 'package:welcomestoreapp/Data%20Management/Repository/productrepository.dart';
import 'package:welcomestoreapp/Logic%20Builder/CategoryProductLogic/categoryproductstate.dart';

class CategoryProductCubits extends Cubit<CategoryProductsState> {
  final CategoryModel categoryid;
  CategoryProductCubits(this.categoryid) : super(CpvInitialState()) {
    cpvinitialstate();
  }
  final _productRepository = ProductRepository();

  void cpvinitialstate() async {
    emit(CpvLoadingState(state.cpv));
    try {
      final products =
          await _productRepository.fetchProductsById(categoryid.id!);

      emit(CpvLoadedState(products));
    } catch (error) {
      emit(CpvErrorState(error.toString(), state.cpv));
    }
  }
}
