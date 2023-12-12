import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';

class Brand {
  String name;
  String? img;
  bool? isSelected;
  List<Model> models;

  Brand({required this.name, this.img, this.isSelected, required this.models});
}
