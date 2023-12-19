import 'dart:developer';
import 'package:bid_express/models/responses/location_data/location_data.dart';
import 'package:bid_express/ui/pages/select_location/cubit/select_location_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:location/location.dart' as location;

part 'select_location_state.dart';

class SelectLocationCubit extends Cubit<SelectLocationState> with Utility {
  late LatLng currentLocation;
  LatLng? selectedCoordinates;
  LocationData? locationData;

  SelectLocationCubit() : super(SelectLocationInitial());

  Future<void> checkLocationPermission({bool? isFromInit}) async {
    bool _serviceEnabled;
    LocationPermission _permission;

    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      await Geolocator.requestPermission().then((value) {
        _permission = value;
      });
      log('Location service are denied');
    }
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      if (_permission == LocationPermission.denied) {
        log('Location permissions are denied');
        emit(GetCurrentLocationErrorState());
      }
    }

    if (_permission == LocationPermission.deniedForever ||
        _permission == LocationPermission.denied) {
      log('Location permission are permanently denied');
      emit(GetCurrentLocationErrorState());
    }

    if (_permission == LocationPermission.whileInUse ||
        _permission == LocationPermission.always) {
      await getCurrentLocation(isFromInit: isFromInit);
    }
  }

  void selectLocation(LatLng coordinates) {
    selectedCoordinates = coordinates;
    emit(SelectLocationSuccessState());
  }

  Future<void> getCurrentLocation({bool? isFromInit}) async {

    final _serviceEnabled = await location.Location().requestService();
    if (_serviceEnabled) {
      if (isFromInit ?? false) {
        emit(GetSelectedLocationDataLoadingState());
      }
      await Geolocator.getCurrentPosition().then((value) {
        currentLocation = LatLng(value.latitude, value.longitude);
        emit(GetCurrentLocationSuccessState());
      });
    } else {
      emit(GetCurrentLocationErrorState(isService: true));
    }
  }

  Future<void> getSelectedLocationData({bool? isCurrentLocation}) async {
    if (!(isCurrentLocation ?? false)) {
      emit(GetSelectedLocationDataLoadingState());
    }

    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        SelectLocationRepo()
            .getSelectedLocationData(isCurrentLocation ?? false
                ? currentLocation
                : (selectedCoordinates ?? const LatLng(0, 0)))
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
