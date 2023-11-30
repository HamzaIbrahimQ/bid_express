import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/select_location/cubit/select_location_cubit.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({Key? key}) : super(key: key);

  @override
  State<SelectLocationPage> createState() => SelectLocationPageState();
}

class SelectLocationPageState extends State<SelectLocationPage>
    with UiUtility, WidgetsBindingObserver {
  late GoogleMapController _mapController;

  final Set<Marker> _markers = {};

  late SelectLocationCubit _selectLocationCubit;

  bool _settingsOpened = false;

  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(31.94027901961375, 35.90637545762584),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    geo.Geolocator.getServiceStatusStream().listen((geo.ServiceStatus status) {
      if (status == geo.ServiceStatus.enabled) {
        _selectLocationCubit.getCurrentLocation();
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_settingsOpened && state == AppLifecycleState.resumed) {
      _selectLocationCubit.checkLocationPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectLocationCubit = context.read<SelectLocationCubit>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getAppBar(
        context: context,
        title: 'Select Location',
        hasBackIcon: true,
      ),
      body: BlocConsumer<SelectLocationCubit, SelectLocationState>(
        listener: (context, state) {
          if (state is GetCurrentLocationSuccessState) {
            _animateToCurrentPosition();
            _settingsOpened = false;
          }

          if (state is GetCurrentLocationErrorState) {
            _settingsOpened = false;
            if (state.isService ?? false) {
              _showLocationServiceError();
            } else {
              _showLocationPermissionError();
            }
          }

          if (state is SelectLocationSuccessState) {
            _selectLocationCubit.getSelectedLocationData();
          }

          if (state is SelectLocationErrorState) {
            showErrorToast(context: context);
          }

          if (state is DeleteSelectedLocationState) {
            _markers.clear();
          }

          if (state is GetSelectedLocationDataLoadingState) {
            LoadingView.shared.startLoading(context);
          }

          if (state is GetSelectedLocationDataSuccessState) {
            LoadingView.shared.stopLoading();
            _addMarker();
          }

          if (state is GetSelectedLocationDataErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context);
          }

          if (state is SelectedLocationOutOfRangeState) {
            LoadingView.shared.stopLoading();
            showErrorToast(
                context: context,
                msg: 'Please select a location inside Jordan');
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              /// Map view
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapToolbarEnabled: true,
                padding: EdgeInsets.only(top: .71.sh, bottom: .1.sh),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                onTap: (LatLng location) {
                  _selectLocationCubit.selectLocation(location);
                },
              ),

              /// Buttons
              Visibility(
                visible: _showButtons(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 24.h),
                      child: Row(
                        children: [
                          /// Cancel button
                          Flexible(
                            child: MainButton(
                              title: 'CANCEL',
                              onTap: _onCancel,
                            ),
                          ),

                          6.horizontalSpace,

                          /// Set button
                          Flexible(
                            child: MainButton(
                              title: 'SET',
                              onTap: _onSet,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _animateToCurrentPosition() async {
    await _mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: _selectLocationCubit.currentLocation, zoom: 17),
    ));
  }

  void _showLocationPermissionError() {
    showErrorToast(
        context: context,
        duration: 5,
        button: OutlinedButton(
          onPressed: () async => await _openSettings(),
          child: const Text(
            'Open Settings',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
          ),
        ),
        msg: "Can't access your location, please check the location "
            'permission in app settings');
  }

  void _showLocationServiceError() {
    showErrorToast(
        context: context,
        msg: "Can't access your location, please enable "
            'the location service on your device');
  }

  Future<void> _openSettings() async {
    _settingsOpened = true;
    await openAppSettings();
  }

  void _addMarker() {
    _markers.clear();
    _markers.add(Marker(
      markerId: MarkerId(_selectLocationCubit.selectedCoordinates.toString()),
      position: _selectLocationCubit.selectedCoordinates ?? const LatLng(0, 0),
    ));
  }

  void _onCancel() {
    _selectLocationCubit.deleteLocation();
  }

  void _onSet() {
    Navigator.of(context).pop(_selectLocationCubit.locationData);
  }

  bool _showButtons() {
    return _selectLocationCubit.selectedCoordinates != null &&
        _selectLocationCubit.locationData?.addressData?.countryCode
                ?.toLowerCase() ==
            'jo';
  }
}
