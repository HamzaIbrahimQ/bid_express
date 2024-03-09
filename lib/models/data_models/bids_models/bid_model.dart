class BidModel {
  final int orderID;
  final String carYear;
  final String carName ;
  List<String> carParts ;

  BidModel({
    required this.orderID ,
    required this.carParts ,
    required this.carName ,
    required this.carYear ,
});
}
