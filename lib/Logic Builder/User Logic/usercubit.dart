import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';
import 'package:welcomestoreapp/Data%20Management/Repository/customer_Repository.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Services/preferences.dart';

class UserCubits extends Cubit<UserState> {
  UserCubits() : super(Userinitialstate()) {
    _cubitinitialize();
  }

  final CustomerRepository _customer_repository = CustomerRepository();

  void _emitloggedinstate({
    required CustomerModel userModel,
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
      CustomerModel userModel =
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
      CustomerModel guestModel = await _customer_repository.createAccount(
          email: email, password: password);

      _emitloggedinstate(
          userModel: guestModel, email: email, password: password);
    } catch (message) {
      emit(Usererrorstate(message.toString()));
    }
  }

  Future<bool> updatedUser(CustomerModel usermodel) async {
    emit(Userloadingstate());
    try {
      CustomerModel updateduser =
          await _customer_repository.updateuser(usermodel);

      emit(Userloggedinstate(updateduser));
      return true;
    } catch (message) {
      emit(Usererrorstate(message.toString()));
      return false;
    }
  }

  void signout() async {
    await Preference.clear();
    emit(Userlogoutstate());
  }
}
