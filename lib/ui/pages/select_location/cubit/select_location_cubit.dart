import 'dart:developer';

import 'package:bid_express/models/data_models/coordinates/coordinates.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'select_location_state.dart';

class SelectLocationCubit extends Cubit<SelectLocationState> {
  late LatLng selectedCoordinates;
  late LatLng currentLocation;

  SelectLocationCubit() : super(SelectLocationInitial());

  Future<void> checkLocationPermission() async {
    bool _serviceEnabled;
    LocationPermission _permission;


    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      log('Location service are denied');
    }
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        log('Location permissions are denied');
        emit(GetCurrentLocationErrorState());
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      log('Location permission are permanently denied');
      emit(GetCurrentLocationErrorState());
    }

    if (_permission == LocationPermission.whileInUse ||
        _permission == LocationPermission.always) {
      await getCurrentLocation();
    } else {
      emit(GetCurrentLocationErrorState());
    }
  }

  void selectLocation(LatLng coordinates) {
    selectedCoordinates = coordinates;
    emit(SelectLocationSuccessState());
  }

  Future<void> getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((value) {
      currentLocation = LatLng(value.latitude, value.longitude);
      emit(GetCurrentLocationSuccessState());
    }).onError((error, stackTrace) {
      emit(GetCurrentLocationErrorState(isService: true));
    });
  }
}
