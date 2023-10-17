import 'package:intl/intl.dart';

final NumberFormat amountFormat = NumberFormat('###,###', 'en_US');

/// mobile regex
final RegExp mobileRegex = RegExp(r'^07[0-9]*$');

/// password regex
final RegExp passwordRegex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@.#\$&*~])\S{8,}$');

/// business name regex
final RegExp businessNameRegex =
    RegExp(r'^[a-zA-Z\u0600-\u06FF][a-zA-Z0-9\u0600-\u06FF]*$');

/// street and building name regex
final RegExp streetAndBuildingRegex =
RegExp(r'^[a-zA-Z0-9\u0600-\u06FF]+$');
