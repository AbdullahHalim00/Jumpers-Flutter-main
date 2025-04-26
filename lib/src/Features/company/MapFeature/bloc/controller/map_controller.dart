import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jumper/src/Core/services/geolocation_services.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class MapController extends GetxController {
  final LatLng? currentPosition;

  MapController({this.currentPosition});

  GoogleMapController? _mapController;

  final CameraPosition defaultCameraPos = const CameraPosition(
    target: LatLng(24.57903017438366, 39.58788191715644),
    zoom: 7,
  );

  /// fill lists ---------------------------------------------------------------
  List<Marker> _markers = [];

  List<Marker> get markers => _markers;

  GoogleMapController get mapController => _mapController!;

  void _addMarkers(LatLng position) async {
    _cleanMarkers();
    BitmapDescriptor? customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/icons/map_marker.png",
    );
    _markers.add(
      Marker(
          icon: customIcon,
          // icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
          markerId: MarkerId("${position.latitude}"),
          position: LatLng(position.latitude, position.longitude),
          draggable: true,
          onDrag: onTapUpdate),
    );
    _turnLocationToAddress(position);
    update();
  }

  void addMarkers(LatLng position) async {
    _cleanMarkers();
    BitmapDescriptor? customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/icons/map_marker.png",
    );
    _markers.add(
      Marker(
          icon: customIcon,
          // icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
          markerId: MarkerId("${position.latitude}"),
          position: LatLng(position.latitude, position.longitude),
          draggable: true,
          onDrag: onTapUpdate),
    );
    _turnLocationToAddress(position);
    update();
  }

  /// Clean lists --------------------------------------------------------------
  void _cleanMarkers() {
    _markers = [];
    update();
  }

  /// Turn position into address -----------------------------------------------
  String? _address = "";

  String? get address => _address;
  String? _detailedAddress = "";

  String? get detailedAddress => _detailedAddress;

  RequestStatus status = RequestStatus.initial;

  void _turnLocationToAddress(LatLng position) {
    GeolocationServices()
        .positionToAddress(position.latitude, position.longitude)
        .then((value) {
      _address = "${value?.administrativeArea ?? ""} ${value?.name ?? ""} ";
      _detailedAddress = "${value?.street}  ${value?.subAdministrativeArea}  ";
      printDM("value => $value");
      printDM("_position is => $_position");
    });
    update();
  }

  /// onTap -----------------------------------------------------------
  void onTapUpdate(LatLng newPosition) {
    printDM('onTapUpdate...');
    _addMarkers(newPosition);
    _position = newPosition;
    
    update();
  }

  /// on map created -----------------------------------------------------------
  var _isMapCreated = false;

  bool get isMapCreated => _isMapCreated;

  void onMapCreated(GoogleMapController controller) {
    // _fillMarkers();
    debugPrint("isMapCreated : $isMapCreated");
    _mapController = controller;
    // getLocation();
    debugPrint("_mapController : $_mapController");

    /// initial position
    if (_isMapCreated) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(_currentCameraPosition!),
      );
    }

    debugPrint("isMapCreated : $isMapCreated");
  }

  /// location -----------------------------------------------------------------
  LatLng? _position;

  LatLng? get position => _position;
  CameraPosition? _currentCameraPosition;

  CameraPosition? get currentCameraPosition => _currentCameraPosition;

  Future<void> getLocation() async {
    _isMapCreated = false;
    update();
    _position = currentPosition;
    update();
    print("position is 2 => ${_position}");
    _currentCameraPosition = CameraPosition(
      target: LatLng(_position!.latitude, _position!.longitude),
      zoom: 10.5,
      tilt: 45,
      bearing: 0,
    );
    _addMarkers(_currentCameraPosition!.target);
    // _turnLocationToAddress(_currentCameraPosition!.target);
    _isMapCreated = true;
    update();
    double currentLocationZoom = await _mapController?.getZoomLevel() ?? 16.5;
    debugPrint(
      "Current Location : $_position"
      " "
      "current Zoom is : $currentLocationZoom",
    );
  }

  Future<void> updateLocation() async {
    double currentLocationZoom = await _mapController?.getZoomLevel() ?? 16.5;
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_position!.latitude, _position!.longitude),
          // zoom: currentLocationZoom,
          zoom: 12,
          bearing: 90,
          tilt: 45.0,
        ),
      ),
    );
    _addMarkers(LatLng(_position!.latitude, _position!.longitude));
    debugPrint("Updated Location : $_position"
        " "
        "current Zoom is : $currentLocationZoom");
    update();
  }



  showMyLocation() async {

    final locationResponse = await GeolocationServices().determinePosition();
    double _lat = locationResponse!.position!.latitude;
    double _lon = locationResponse.position!.longitude;


    double currentLocationZoom = await _mapController?.getZoomLevel() ?? 16.5;
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_lat, _lon),
          // zoom: currentLocationZoom,
          zoom: 12,
          bearing: 90,
          tilt: 45.0,
        ),
      ),
    );
    _addMarkers(LatLng(_lat, _lon));
    _position = LatLng(_lat, _lon);
    debugPrint("Updated Location : $_lat $_lon"
        " "
        "current Zoom is : $currentLocationZoom");
    update();
  }

  /// custom Markers --------------------------------------------------------

  List<Marker> customMarkers = [];

  void moveCameraToMarker({required double lat, required double lon}) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lon),
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    printDM('_lat in add is onInit $currentPosition');
    getLocation();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    printDM('_lat in add is dispose $currentPosition');
    super.dispose();
  }
}
