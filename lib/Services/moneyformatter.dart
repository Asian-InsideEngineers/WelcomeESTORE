import 'package:intl/intl.dart';

class Formatter {
  static String formatPrice(num price) {
    final numberFormat = NumberFormat("₹#,##,###/-");
    return numberFormat.format(price);
  }

  static String formateDate(DateTime date) {
    DateTime localdate = date.toLocal();
    final dateformate = DateFormat("dd, MMM, y, hh:mm a");

    return dateformate.format(localdate);
  }
}
