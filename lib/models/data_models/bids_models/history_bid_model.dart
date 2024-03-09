class BidHistoryModel {
  final int orderID;
  final String carYear;
  final String carName ;
  List<String> carParts ;
  final DateTime  timeDate;
  final double rateCount ;
  final double price;

  BidHistoryModel({
    required this.orderID ,
    required this.carParts ,
    required this.carName ,
    required this.carYear ,
    required this.price ,
    required this.timeDate ,
    required this.rateCount,

  });
}
