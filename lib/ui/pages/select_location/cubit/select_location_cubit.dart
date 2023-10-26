import 'dart:developer';
import 'package:bid_express/models/responses/location_data/location_data.dart';
import 'package:bid_express/ui/pages/select_location/cubit/select_location_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'select_location_state.dart';

class SelectLocationCubit extends Cubit<SelectLocationState> with Utility {
  late LatLng currentLocation;
  LatLng? selectedCoordinates;
  LocationData? locationData;

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

  Future<void> getSelectedLocationData() async {
    emit(GetSelectedLocationDataLoadingState());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        SelectLocationRepo()
            .getSelectedLocationData(selectedCoordinates ?? const LatLng(0, 0))
            .then((value) async {
          if (value?.placeId != null) {
            if (value?.addressData?.countryCode?.toLowerCase() != 'jo') {
              emit(SelectedLocationOutOfRangeState());
            } else {
              locationData = value ?? LocationData();
              emit(GetSelectedLocationDataSuccessState());
            }
          } else {
            emit(GetSelectedLocationDataErrorState());
          }
        }).catchError((e) {
          log(e.toString());
          emit(GetSelectedLocationDataErrorState(error: e.toString()));
        });
      } catch (e) {
        log(e.toString());
        emit(GetSelectedLocationDataErrorState(error: e.toString()));
      }
    } else {
      emit(GetSelectedLocationDataErrorState());
    }
  }

  void deleteLocation() {
    selectedCoordinates = null;
    locationData = null;
    emit(DeleteSelectedLocationState());
  }

}
