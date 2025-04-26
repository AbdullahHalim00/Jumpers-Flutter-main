import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

class LocationScreen extends StatefulWidget {
  double? latitude;
  double? longitude;

  LocationScreen({this.latitude, this.longitude});

  @override
  State<LocationScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<LocationScreen> {
  GoogleMapController? controller;
  List<Placemark> placemarks = [];
  Set<Marker> markers = {};
  LatLng? myLocation;
  BitmapDescriptor? CustomIcon;
  String? Address = '';
  bool isFirstTime = false;
  LatLng? markerPoint;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // getUserLocation();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 3,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Location',
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
          leadingWidth: 100.w,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.primary,
                  size: 17,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Back',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                onCameraIdle: () {},
                markers: markers,
                onMapCreated: (GoogleMapController controller) async {
                  this.controller = controller;

                  await markers.add(Marker(
                    markerId: MarkerId(
                      'new',
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                    position:
                        LatLng(widget.latitude ?? 0.0, widget.longitude ?? 0.0),
                  ));
                  setState(() {});
                },
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(widget.latitude ?? 0.0, widget.longitude ?? 0.0),
                  zoom: 17.0,
                ),
              ),
            ],
          ),
        ));
  }
}
