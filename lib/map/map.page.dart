import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  LatLng? _CurrentLocatiion;

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
      setState(() {
        _CurrentLocatiion = LatLng(position.latitude, position.longitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      markers: {
                        Marker(
                          markerId: MarkerId('currentLocation'),
                          position: _CurrentLocatiion!,
                          infoWindow: InfoWindow(title: 'You  are here'),
                        ),
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
                        hintText: "456123",
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
                    Container(
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
                        child: Text(
                          "Confirm Location",
                          style: GoogleFonts.dmSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 137, 26, 255),
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
