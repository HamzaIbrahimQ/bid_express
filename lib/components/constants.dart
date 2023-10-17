import 'package:intl/intl.dart';

final NumberFormat amountFormat = NumberFormat('###,###', 'en_US');

/// password regex
final RegExp passwordRegex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@.#\$&*~])\S{8,}$');
