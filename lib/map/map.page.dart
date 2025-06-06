import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping_app_olx/map/model/locationBodyModel.dart';
import 'package:shopping_app_olx/map/service/locationController.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  GoogleMapController? _mapController;
  LatLng? _CurrentLocatiion;
  String _address = 'Loading';
  MapType _currentMapType = MapType.normal;
  double manuelLAt = 0.0;
  double manuelLong = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPermissionAndLocation();
  }

  Future<void> _getPermissionAndLocation() async {
    await Permission.location.request();
    if (await Permission.location.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LatLng latLng = LatLng(position.latitude, position.longitude);
      setState(() {
        _CurrentLocatiion = LatLng(position.latitude, position.longitude);
      });

      _getAddressFromLatLng(latLng);
    }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        /// ye ek line pin code nikalne ke liye
        Placemark place = placemarks[0];

        setState(() {
          manuelLAt = latLng.latitude;
          manuelLong = latLng.longitude;
          _address =
              "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        });
      }
    } catch (e) {
      log("Error fetching address: $e");
      setState(() {
        _address = "Address not found";
      });
    }
  }

  Set<Polyline> _polylines = {};
  List<LatLng> polylinecordinates = [
    LatLng(28.6139, 77.2090), // Point A (Delhi)
    LatLng(28.5355, 77.3910), // Point B (Noida)
  ];

  void _toggleMapType() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.none ? MapType.satellite : MapType.normal;
    });
  }

  Future<void> getLatLngFromAdress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        double latitude = locations.first.latitude;
        double longitude = locations.first.longitude;
        setState(() {
          manuelLAt = latitude;
          manuelLong = longitude;
        });
        print('Latitude: $latitude, Longitude: $longitude');
      } else {
        print("No result found");
      }
    } catch (e) {
      print("Error occured : $e");
    }
  }

  void _addPolyline() {
    Polyline polyline = Polyline(
      polylineId: PolylineId("rout"),
      color: Color.fromARGB(255, 137, 26, 255),
      width: 5,
      points: polylinecordinates,
    );
    setState(() {
      _polylines.add(polyline);
    });
  }

  bool isLocation = false;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:
                _CurrentLocatiion == null
                    ? Center(child: CircularProgressIndicator())
                    : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _CurrentLocatiion!,
                        zoom: 15,
                      ),
                      mapType: _currentMapType,
                      markers: {
                        Marker(
                          markerId: MarkerId('currentLocation'),
                          position: _CurrentLocatiion!,
                          infoWindow: InfoWindow(title: 'You  are here'),
                          draggable: true,
                          onDragEnd: (newPosition) {
                            _CurrentLocatiion = newPosition;
                            _getAddressFromLatLng(newPosition);
                          },
                        ),
                      },
                      onTap: (latLng) {
                        setState(() {
                          _CurrentLocatiion = latLng;
                        });
                        _getAddressFromLatLng(latLng);
                      },
                      myLocationEnabled: true,
                      onMapCreated: (controller) => _mapController = controller,
                    ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 242, 247),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Pincode",
                      style: GoogleFonts.dmSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 36, 33, 38),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30.45.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30.45.r),
                          borderSide: BorderSide.none,
                        ),
                        hintText:
                            _address.isNotEmpty
                                ? _address
                                : "Fetching address...",
                        hintStyle: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 36, 33, 38),
                        ),
                        suffixIcon: Icon(
                          Icons.my_location,
                          color: Color.fromARGB(255, 137, 26, 255),
                          size: 25.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLocation = true;
                        });
                        if (_CurrentLocatiion != null) {
                          final pickedLat = _CurrentLocatiion!.latitude;
                          final pickedLng = _CurrentLocatiion!.longitude;
                          final pickedAddress = _address;
                          final locationbody = LocationBodyModel(
                            userId: box.get("id").toString(),
                            latitude: pickedLat,
                            longitude: pickedLng,
                          );
                          ref
                              .watch(locationController(locationbody).future)
                              .then((_) {
                                Fluttertoast.showToast(
                                  msg: "Location sent successfully!",
                                );
                                Navigator.pop(context);
                              })
                              .catchError((e) {
                                setState(() {
                                  isLocation = false;
                                });
                                log(e.toString());
                                Fluttertoast.showToast(
                                  msg: "Failed: ${e.toString()}",
                                );
                              });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 49.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.45.r),
                          border: Border.all(
                            color: Color.fromARGB(255, 137, 26, 255),
                            width: 1.sp,
                          ),
                        ),
                        child: Center(
                          child:
                              isLocation == false
                                  ? Text(
                                    "Confirm Location",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 137, 26, 255),
                                    ),
                                  )
                                  : Center(
                                    child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 137, 26, 255),
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
