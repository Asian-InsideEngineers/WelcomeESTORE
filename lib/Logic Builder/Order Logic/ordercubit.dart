import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';
import 'package:welcomestoreapp/Data%20Management/Models/ordermodel.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';

import 'package:welcomestoreapp/Logic%20Builder/Order%20Logic/orderstate.dart';

import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';

import '../../Data Management/Repository/orderrepository.dart';

class OrderCubits extends Cubit<OrderState> {
  final UserCubits _userCubits;
  final CartCubits _cartCubits;
  StreamSubscription? _orderSubscription;

  OrderCubits(this._userCubits, this._cartCubits) : super(OrderInitialState()) {
    _handleUserStates(_userCubits.state);
    _orderSubscription = _userCubits.stream.listen(_handleUserStates);
  }
  void _handleUserStates(UserState userState) {
    if (userState is Userloggedinstate) {
      orderInitilization(userState.userModel.id!);
    } else if (userState is Userlogoutstate) {
      emit(OrderInitialState());
    }
  }

  final orderrepository = OrderRepository();

  void orderInitilization(String userId) async {
    emit(OrderLoadingState(state.orders));
    try {
      final orderitems = await orderrepository.fetchOrdersForCustomers(userId);
      emit(OrderLoadedState(orderitems));
    } catch (ex) {
      emit(OrderErrorState(ex.toString(), state.orders));
    }
  }

  Future<bool> createOrders({required List<CartModel> items}) async {
    emit(OrderLoadingState(state.orders));
    try {
      if (_userCubits.state is! Userloggedinstate) {
        return false;
      }
      OrderModel neworders = OrderModel(
        items: items,
        status: "Order hasbeen placed succesfully",
        Customers: (_userCubits.state as Userloggedinstate).userModel,
      );

      final createorder = await orderrepository.createorder(neworders);
      List<OrderModel> orders = [...state.orders, createorder];
      emit(OrderLoadedState(orders));
      _cartCubits.cartclear();
      return true;
    } catch (ex) {
      emit(OrderErrorState(ex.toString(), state.orders));
      return false;
    }
  }

  @override
  Future<void> close() {
    _orderSubscription?.cancel();
    return super.close();
  }
}
