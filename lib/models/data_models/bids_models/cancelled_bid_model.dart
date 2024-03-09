class BidCancelledModel {
  final int orderID;
  final String carYear;
  final String carName ;
  List<String> carParts ;
  final DateTime timaDate;
  final String reasonCancelled ;
  BidCancelledModel({
    required this.orderID ,
    required this.carParts ,
    required this.carName ,
    required this.carYear ,
     required this.reasonCancelled  ,
    required this.timaDate
  });
}
