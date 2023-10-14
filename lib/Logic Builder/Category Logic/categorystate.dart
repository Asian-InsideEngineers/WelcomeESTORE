import 'package:welcomestoreapp/Data%20Management/Models/categories.dart';

abstract class CategoryStates {
  final List<CategoryModel> categories;
  CategoryStates(this.categories);
}

class CategoryInitialState extends CategoryStates {
  CategoryInitialState() : super([]);
}

class CategoryLoadingState extends CategoryStates {
  CategoryLoadingState(super.categories);
}

class CategoryLoadedState extends CategoryStates {
  CategoryLoadedState(super.categories);
}

class CategoryErrorState extends CategoryStates {
  final String message;
  CategoryErrorState(this.message, super.categories);
}
