import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';
import 'package:welcomestoreapp/Data%20Management/Repository/customer_Repository.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cubits/userstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Services/preferences.dart';

class UserCubits extends Cubit<UserState> {
  UserCubits() : super(Userinitialstate()) {
    _cubitinitialize();
  }

  final customer_Repository _customer_repository = customer_Repository();

  void _emitloggedinstate({
    required customer_Model userModel,
    required String email,
    required String password,
  }) async {
    await Preference.saveUserDetails(email, password);
    emit(Userloggedinstate(userModel));
  }

  void _cubitinitialize() async {
    final userDetails = await Preference.fetchUserDetails();
    String? email = userDetails["email"];
    String? password = userDetails["password"];

    if (email == null || password == null) {
      emit(Userlogoutstate());
    } else {
      signIn(email: email, password: password);
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    emit(Userloadingstate());
    try {
      customer_Model userModel =
          await _customer_repository.signIn(email: email, password: password);
      _emitloggedinstate(
          userModel: userModel, email: email, password: password);
    } catch (message) {
      emit(Usererrorstate(message.toString()));
    }
  }

  void createAccount({
    required String email,
    required String password,
  }) async {
    emit(Userloadingstate());
    try {
      customer_Model guestModel = await _customer_repository.createAccount(
          email: email, password: password);

      _emitloggedinstate(
          userModel: guestModel, email: email, password: password);
    } catch (message) {
      emit(Usererrorstate(message.toString()));
    }
  }

  void clear() async {
    await Preference.clear();
    emit(Userlogoutstate());
  }
}
