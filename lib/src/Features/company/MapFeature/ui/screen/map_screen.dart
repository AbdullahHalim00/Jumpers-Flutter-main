part of 'imports_map_screen.dart';

class MapScreen extends StatefulWidget {
  final Function(String, LatLng) onSave;
  final LatLng currentPosition;

  const MapScreen(
      {required this.currentPosition, required this.onSave, Key? key})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _startSearchFieldController = TextEditingController();

  final _endSearchFieldController = TextEditingController();

  DetailsResult? startPosition;

  DetailsResult? endPosition;

  late FocusNode startFocusNode;

  late FocusNode endFocusNode;

  late GooglePlace googlePlace;

  List<AutocompletePrediction> predictions = [];

  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String apiKey = 'AIzaSyDhgbrJSBeUZGZMYkXw4-c0yj-M8_wfvSw';
    googlePlace = GooglePlace(apiKey);

    startFocusNode = FocusNode();
    endFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MapController(currentPosition: widget.currentPosition));
    return GetBuilder<MapController>(builder: (_) {
      return DefaultScaffold(
        appBarTitle: "work_location".tr,
        appBarColor: AppColors.white.withOpacity(.1),
        padding: EdgeInsets.zero,
        body: ConditionalBuilder(
          condition: _.isMapCreated,
          onBuild: Padding(
            padding: AppInsets.defaultScreenVertical,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  mapToolbarEnabled: false,
                  compassEnabled: false,
                  onTap: _.onTapUpdate,
                  onMapCreated: _.onMapCreated,
                  // onCameraMove: _.onCameraMove,
                  markers: _.markers.toSet(),
                  // markers: customMarkers.toSet(),


                  initialCameraPosition:
                      _.currentCameraPosition ?? _.defaultCameraPos,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        CustomIconAvatar(
                          color: AppColors.white,
                          radius: 41.r,
                          imageUrl: Assets.location,
                          onTap: () {
                            _.showMyLocation();
                          },
                        ),
                        CustomIconAvatar(
                          color: AppColors.white,
                          radius: 41.r,
                          imageUrl: Assets.gps,
                          onTap: () {
                            _.updateLocation();
                          },
                        ),
                      ],
                    ),
                    YSpace.hard,
                    LocationButton(onTap: () {
                      printDM("enter her l 1");
                      widget.onSave(
                          "${_.address}${_.detailedAddress}", _.position!);
                      printDM("enter her l 2");
                      //
                      Get.back();
                    }),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: TextFormField(
                          controller: _startSearchFieldController,
                          autofocus: false,
                          focusNode: startFocusNode,
                          style: TextStyle(fontSize: 18.sp),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            hintText: "search".tr,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.sp),
                            border: InputBorder.none,
                            suffixIcon:
                                _startSearchFieldController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            predictions = [];
                                            _startSearchFieldController.clear();
                                          });
                                        },
                                        icon: Icon(Icons.clear_outlined),
                                      )
                                    : null,
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(0.6),
                                    width: .8.w)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.red.withOpacity(0.6),
                                    width: .8.w)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.6),
                                    width: .8.w)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.6),
                                    width: .8.w)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.6),
                                    width: .8.w)),
                          ),
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false)
                              _debounce!.cancel();
                            _debounce =
                                Timer(const Duration(milliseconds: 0), () {
                              if (value.isNotEmpty) {
                                //places api
                                autoCompleteSearch(value);
                              } else {
                                //clear out the results
                                setState(() {
                                  predictions = [];
                                  startPosition = null;
                                });
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        color: Colors.white,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: predictions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(
                                    Icons.pin_drop,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  predictions[index].description.toString(),
                                ),
                                onTap: () async {
                                  final placeId = predictions[index].placeId!;
                                  final details =
                                      await googlePlace.details.get(placeId);
                                  if (details != null &&
                                      details.result != null &&
                                      mounted) {
                                    if (startFocusNode.hasFocus) {
                                      setState(() {
                                        startPosition = details.result;
                                        _startSearchFieldController.text =
                                            details.result!.name!;
                                        predictions = [];
                                      });
                                    }

                                    if (startPosition != null) {
                                      FocusScope.of(context).unfocus();
                                      printDM('navigate');
                                      _.onTapUpdate(LatLng(
                                          startPosition!
                                              .geometry!.location!.lat!,
                                          startPosition!
                                              .geometry!.location!.lng!));
                                      _.mapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                          target: LatLng(
                                              startPosition!
                                                  .geometry!.location!.lat!,
                                              startPosition!
                                                  .geometry!.location!.lng!),
                                          // zoom: currentLocationZoom,
                                          zoom: 12,
                                          bearing: 90,
                                          tilt: 45.0,
                                        )),
                                      );
                                    } else {
                                      printDM("Error");
                                    }
                                  }
                                },
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          onFeedBack: const MapLoadingBuilder(),
        ),
      );
    });
  }
}
