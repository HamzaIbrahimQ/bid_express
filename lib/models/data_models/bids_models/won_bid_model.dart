class WonBidModel {
  final int orderID;
  final String carYear;
  final String carName ;
  List<String> carParts ;
  final double price ;
  final String name ;
  final String image ;
  final String phoneNumber;
  final DateTime timaDate;


  WonBidModel({
    required this.orderID ,
    required this.carParts ,
    required this.carName ,
    required this.carYear ,
    required this.price ,
    required this.name ,
    required this.image ,
    required this.phoneNumber ,
    required this.timaDate,
  });
}
