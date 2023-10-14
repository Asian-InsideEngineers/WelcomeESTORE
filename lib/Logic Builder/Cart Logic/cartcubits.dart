import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';
import 'package:welcomestoreapp/Data%20Management/Models/products.dart';
import 'package:welcomestoreapp/Data%20Management/Repository/cartrepository.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartstates.dart';

import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';

class CartCubits extends Cubit<CartState> {
  final UserCubits _userCubits;
  StreamSubscription? _cartSubscription;

  CartCubits(this._userCubits) : super(CartInititalState()) {
    _handleUserStates(_userCubits.state);
    _cartSubscription = _userCubits.stream.listen(_handleUserStates);
  }
  void _handleUserStates(UserState userState) {
    if (userState is Userloggedinstate) {
      cartInitilization(userState.userModel.sId!);
    } else if (userState is Userlogoutstate) {
      emit(CartInititalState());
    }
  }

  final _cartRepository = CartRepository();

  void cartInitilization(String userId) async {
    emit(CartLoadingstate(state.items));
    try {
      final cartItems = await _cartRepository.fetchAllCartItems(userId);
      emit(CartLoadedState(cartItems));
    } catch (ex) {
      emit(CartErrorState(ex.toString(), state.items));
    }
  }

  void addToCart(ProductModel products, int quantity) async {
    try {
      emit(CartLoadingstate(state.items));
      if (_userCubits.state is Userloggedinstate) {
        Userloggedinstate newUserState = _userCubits.state as Userloggedinstate;
        CartItemModel newItem = CartItemModel(
          products: products,
          quantity: quantity,
        );

        final cartAddedItems = await _cartRepository.addToCart(
            newItem as String, newUserState.userModel.sId! as CartItemModel);

        emit(CartLoadedState(cartAddedItems));
      } else {
        throw ("your're Loggedout");
      }
    } catch (ex) {
      emit(CartErrorState(ex.toString(), state.items));
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
