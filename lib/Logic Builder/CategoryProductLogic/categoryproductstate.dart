import 'package:welcomestoreapp/Data%20Management/Models/products.dart';

abstract class CategoryProductsState {
  final List<ProductModel> cpv;
  CategoryProductsState(this.cpv);
}

class CpvInitialState extends CategoryProductsState {
  CpvInitialState() : super([]);
}

class CpvLoadingState extends CategoryProductsState {
  CpvLoadingState(super.cpv);
}

class CpvLoadedState extends CategoryProductsState {
  CpvLoadedState(super.cpv);
}

class CpvErrorState extends CategoryProductsState {
  final String message;
  CpvErrorState(this.message, super.cpv);
}
