import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';

final List<Brand> testBrands = [
  Brand(
    id: 0,
    name: 'Honda',
    models: [
      Model(id: 0, name: 'Civic'),
      Model(id: 1, name: 'Acord'),
      Model(id: 2, name: 'Fit'),
      Model(id: 3, name: 'HR-V'),
      Model(id: 4, name: 'Stepwgn'),
    ],
  ),
  Brand(
    id: 1,
    name: 'Ford',
    models: [
      Model(id: 0, name: 'Fusion'),
      Model(id: 1, name: 'Focus'),
      Model(id: 2, name: 'C-Max'),
      Model(id: 3, name: 'Explorer'),
    ],
  ),
  Brand(
    id: 2,
    name: 'Nissan',
    models: [
      Model(id: 0, name: 'Qashqai'),
      Model(id: 1, name: 'Pathfinder'),
      Model(id: 2, name: 'Almera'),
    ],
  ),
  Brand(
    id: 3,
    name: 'Toyota',
    models: [
      Model(id: 0, name: 'Camry'),
      Model(id: 1, name: 'Corolla'),
      Model(id: 2, name: 'Prius'),
      Model(id: 3, name: 'Land cruiser'),
    ],
  ),
];
