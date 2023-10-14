import 'package:welcomestoreapp/Data%20Management/Models/products.dart';

abstract class ProductsStates {
  final List<ProductModel> clientProducts;
  ProductsStates(this.clientProducts);
}

class ProductInitialState extends ProductsStates {
  ProductInitialState() : super([]);
}

class ProductLoadingState extends ProductsStates {
  ProductLoadingState(super.clientProducts);
}

class ProductLoadedState extends ProductsStates {
  ProductLoadedState(super.clientProducts);
}

class ProductErrorState extends ProductsStates {
  final String message;
  ProductErrorState(this.message, super.clientProducts);
}
