import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';

abstract class CartState {
  final List<CartModel> cartitems;
  CartState(this.cartitems);
}

class CartInititalState extends CartState {
  CartInititalState() : super([]);
}

class CartLoadingstate extends CartState {
  CartLoadingstate(super.cartitems);
}

class CartLoadedState extends CartState {
  CartLoadedState(super.cartitems);
}

class CartErrorState extends CartState {
  final String cartMessage;
  CartErrorState(this.cartMessage, super.cartitems);
}
