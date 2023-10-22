import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';
import 'package:welcomestoreapp/main.dart';

class BillingCalculation {
  static num cartTotal(List<CartModel> items) {
    double total = 0;

    for (int i = 0; i < items.length; i++) {
      total += items[i].varients!.price! * items[i].quantity!;
    }
    log.d("Billing Calculation: $total");
    return total;
  }
}
