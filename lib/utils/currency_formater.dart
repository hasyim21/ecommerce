import 'package:intl/intl.dart';

extension CurrencyFormatter on num {
  String toRupiah() {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }
}
