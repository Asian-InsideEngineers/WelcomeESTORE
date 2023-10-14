import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';

abstract class CartState {
  final List<CartItemModel> items;
  CartState(this.items);
}

class CartInititalState extends CartState {
  CartInititalState() : super([]);
}

class CartLoadingstate extends CartState {
  CartLoadingstate(super.items);
}

class CartLoadedState extends CartState {
  CartLoadedState(super.items);
}

class CartErrorState extends CartState {
  final String cartMessage;
  CartErrorState(this.cartMessage, super.items);
}
