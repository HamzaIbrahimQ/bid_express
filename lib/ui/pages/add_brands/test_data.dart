import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';

final List<Brand> testBrands = [
  Brand(
    name: 'Honda',
    models: [
      Model(name: 'Civic'),
      Model(name: 'Acord'),
      Model(name: 'Fit'),
      Model(name: 'HR-V'),
      Model(name: 'Stepwgn'),
    ],
  ),
  Brand(
    name: 'Ford',
    models: [
      Model(name: 'Fusion'),
      Model(name: 'Focus'),
      Model(name: 'C-Max'),
      Model(name: 'Explorer'),
    ],
  ),
  Brand(
    name: 'Nissan',
    models: [
      Model(name: 'Qashqai'),
      Model(name: 'Pathfinder'),
      Model(name: 'Almera'),
    ],
  ),
  Brand(
    name: 'Toyota',
    models: [
      Model(name: 'Camry'),
      Model(name: 'Corolla'),
      Model(name: 'Prius'),
      Model(name: 'Land cruiser'),
    ],
  ),
];
