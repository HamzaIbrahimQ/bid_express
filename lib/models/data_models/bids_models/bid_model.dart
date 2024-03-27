class BidModel {
  final int orderID;
  final String carYear;
  final String carName;

  List<String> carParts;

  final DateTime creationDate;

  BidModel({
    required this.orderID,
    required this.carParts,
    required this.carName,
    required this.carYear,
    required this.creationDate,
  });
}

class SubBidModel {
  final int orderID;
  final String carYear;
  final String carName;
  final String part;
  final DateTime creationDate;

  SubBidModel({
    required this.orderID,
    required this.part,
    required this.carName,
    required this.carYear,
    required this.creationDate,
  });
}

class OrderModel {
  final int orderID;
  final String carYear;
  final String carName;
  final List<SubBidModel>? subOrders;
  final DateTime creationDate;

  OrderModel({
    required this.orderID,
     this.subOrders,
    required this.carName,
    required this.carYear,
    required this.creationDate,
  });
}
