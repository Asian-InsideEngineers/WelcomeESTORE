import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Data%20Management/Models/products.dart';

import 'package:welcomestoreapp/Data%20Management/Repository/varientrepository.dart';

import 'package:welcomestoreapp/Logic%20Builder/Varients%20Logic/varientstates.dart';

class VarientCubits extends Cubit<VarientStates> {
  final ProductModel productId;
  VarientCubits(this.productId) : super(VarientInitialState()) {
    varientInitialization();
  }
  final _varientRepository = VarientRepository();

  void varientInitialization() async {
    emit(VarientLoadingStates(state.productvarients));
    try {
      final products = await _varientRepository.fetchvarientbyid(productId.id!);

      emit(VarientLoadedStates(products));
    } catch (error) {
      emit(VarientErrorStates(error.toString(), state.productvarients));
    }
  }
}
