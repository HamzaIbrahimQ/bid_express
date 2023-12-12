import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';

class Brand {
  int id;
  String name;
  String? img;
  bool? isSelected;
  List<Model> models;
  List<Model>? myModels;
  List<Model>? searchList;

  Brand({
    required this.id,
    required this.name,
    this.img,
    this.isSelected,
    required this.models,
    this.myModels,
    this.searchList,
  });
}
