import 'package:welcomestoreapp/Data%20Management/Models/varients.dart';

abstract class VarientStates {
  final List<VarientModel> productvarients;
  VarientStates(this.productvarients);
}

class VarientInitialState extends VarientStates {
  VarientInitialState() : super([]);
}

class VarientLoadingStates extends VarientStates {
  VarientLoadingStates(super.productvarients);
}

class VarientLoadedStates extends VarientStates {
  VarientLoadedStates(super.productvarients);
}

class VarientErrorStates extends VarientStates {
  final String message;
  VarientErrorStates(this.message, super.productvarients);
}
