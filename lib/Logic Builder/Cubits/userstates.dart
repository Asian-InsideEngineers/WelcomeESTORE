import '../../Data Management/Models/customers.dart';

abstract class UserState {}

class Userinitialstate extends UserState {}

class Userloadingstate extends UserState {}

class Userloggedinstate extends UserState {
  final customer_Model userModel;
  Userloggedinstate(this.userModel);
}

class Userlogoutstate extends UserState {}

class Usererrorstate extends UserState {
  final String message;
  Usererrorstate(this.message);
}
