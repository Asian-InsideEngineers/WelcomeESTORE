import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data Management/Models/varients.dart';
import '../../Data Management/Repository/varientrepository.dart';

class SearchCubit extends Cubit<List<VarientModel>> {
  final VarientRepository _repository = VarientRepository();

  SearchCubit() : super([]);

  void search(String query) async {
    try {
      final data = await _repository.fetchAllVarients();
      final results = data.where((item) {
        var itemTitle = item.title?.toLowerCase() ?? '';
        return itemTitle.contains(query.toLowerCase());
      }).toList();
      emit(results);
    } catch (ex) {
      // Handle errors if needed
    }
  }
}
