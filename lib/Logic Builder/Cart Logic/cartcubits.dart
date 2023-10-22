import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';
import 'package:welcomestoreapp/Data%20Management/Models/varients.dart';

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
      cartInitilization(userState.userModel.id!);
    } else if (userState is Userlogoutstate) {
      emit(CartInititalState());
    }
  }

  final _cartRepository = CartRepository();

  void sortandload(List<CartModel> cartItems) {
    cartItems.sort(
      (a, b) => b.varients!.title!.compareTo(a.varients!.title!),
    );
    emit(CartLoadedState(cartItems));
  }

  void cartInitilization(String userId) async {
    emit(CartLoadingstate(state.cartitems));
    try {
      final cartItems = await _cartRepository.fetchAllCartItems(userId);
      sortandload(cartItems);
    } catch (ex) {
      emit(CartErrorState(ex.toString(), state.cartitems));
    }
  }

  void addToCart(int quantity, VarientModel varients) async {
    try {
      emit(CartLoadingstate(state.cartitems));

      if (_userCubits.state is Userloggedinstate) {
        Userloggedinstate userState = _userCubits.state as Userloggedinstate;
        CartModel newItem = CartModel(
          quantity: quantity,
          varients: varients,
        );

        final cartAddedItems =
            await _cartRepository.addToCart(userState.userModel.id!, newItem);

        sortandload(cartAddedItems);
      } else {
        throw ("your're loggedout");
      }
    } catch (ex) {
      emit(CartErrorState(ex.toString(), state.cartitems));
    }
  }

  void removetocart(VarientModel varients) async {
    try {
      emit(CartLoadingstate(state.cartitems));

      if (_userCubits.state is Userloggedinstate) {
        Userloggedinstate userState = _userCubits.state as Userloggedinstate;

        final cartremoveditems = await _cartRepository.removeFromCart(
            userState.userModel.id!, varients.id!);

        sortandload(cartremoveditems);
      } else {
        throw ("your're loggedout");
      }
    } catch (ex) {
      emit(CartErrorState(ex.toString(), state.cartitems));
    }
  }

  bool cartchecking(VarientModel varients) {
    if (state.cartitems.isNotEmpty) {
      final founditems = state.cartitems
          .where((cartitems) => cartitems.varients!.id == varients.id!)
          .toList();

      if (founditems.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void cartclear() {
    emit(CartLoadedState([]));
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
