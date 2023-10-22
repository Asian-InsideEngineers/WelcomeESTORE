import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/products.dart';

import 'package:welcomestoreapp/Data%20Management/Repository/productrepository.dart';

import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productsstates.dart';

class ProductCubit extends Cubit<ProductsStates> {
  ProductCubit() : super(ProductInitialState()) {
    productinitialization();
  }
  final _productRepository = ProductRepository();

  void productinitialization() async {
    emit(ProductLoadingState(state.clientProducts));
    try {
      List<ProductModel> newproducts =
          await _productRepository.fetchAllProducts();
      emit(ProductLoadedState(
        newproducts,
      ));
    } catch (error) {
      emit(ProductErrorState(error.toString(), state.clientProducts));
    }
  }
}
