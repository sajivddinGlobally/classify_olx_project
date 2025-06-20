import 'dart:convert';
import 'dart:developer';
import 'dart:io' show File;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping_app_olx/cagetory/car.form.page.dart';
import 'package:shopping_app_olx/cagetory/new.plan.page.dart';
import 'package:shopping_app_olx/choseMap/controller/locationNotifer.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/home/home.page.dart';
import 'package:shopping_app_olx/map/map.page.dart';
import 'package:shopping_app_olx/new/new.service.dart';

class RentPropertyFormPage extends ConsumerStatefulWidget {
  const RentPropertyFormPage({super.key});

  @override
  ConsumerState<RentPropertyFormPage> createState() =>
      _RentPropertyFormPageState();
}

class _RentPropertyFormPageState extends ConsumerState<RentPropertyFormPage> {
  final typeContrller = TextEditingController();
  final bhkController = TextEditingController();
  final bathroomController = TextEditingController();
  final furshingController = TextEditingController();
  final projectControler = TextEditingController();
  final listedControlelr = TextEditingController();
  final superbuildController = TextEditingController();
  final carpetControlelr = TextEditingController();
  final mentationController = TextEditingController();
  final florControlelr = TextEditingController();
  final florNumberControler = TextEditingController();
  final carparkingContrller = TextEditingController();
  final facingcontroler = TextEditingController();
  final proejctnameControler = TextEditingController();
  final titleControler = TextEditingController();
  final desContrler = TextEditingController();
  final priceController = TextEditingController();
  File? image;
  final picker = ImagePicker();

  Future<void> pickImageFormCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.camera);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      print("Camera Permission isdenied");
    }
  }

  Future<void> pickImageFromGallery() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      print("Gallery Permission isdenied");
    }
  }

  Future showImage() async {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  pickImageFormCamera();
                  Navigator.pop(context);
                },
                child: Text("Camera"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  pickImageFromGallery();
                  Navigator.pop(context);
                },
                child: Text("Gallery"),
              ),
            ],
          ),
    );
  }

  bool _didRedirect = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_didRedirect) return;

    final shouldRedirect =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;

    if (shouldRedirect) {
      _didRedirect = true;

      // Delay using Future.delayed to let UI settle before navigation
      Future.delayed(Duration(milliseconds: 100), () {
        if (mounted) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const MapPage()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    final location = ref.watch(locationNotifer);
    Map<String, dynamic> data = {
      "type": typeContrller.text,
      "bhk": bhkController.text,
      "bath": bhkController.text,
      "furs": furshingController.text,
      "project": projectControler.text,
      "listed": listedControlelr.text,
      "superbuild": superbuildController.text,
      "carpet": carpetControlelr.text,
      "mentation": mentationController.text,
      "flor": florControlelr.text,
      "florNumber": florNumberControler.text,
      "carparking": carparkingContrller.text,
      "facing": facingcontroler.text,
      "projectname": proejctnameControler.text,
      "title": titleControler.text,
      "des": desContrler.text,
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
                ),
              ),
            ),
            Image.asset("assets/bgimage.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 46.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    "Include some details",
                    style: GoogleFonts.dmSans(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBody(labeltxt: "Type*", controller: typeContrller),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "BHK", controller: bhkController),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Bathrooms",
                        controller: bathroomController,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Furnishing",
                        controller: furshingController,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Project Status",
                        controller: projectControler,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Listed by",
                        controller: listedControlelr,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Super Builtup area sqft*",
                        controller: superbuildController,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Carpet Area sqft*",
                        controller: carpetControlelr,
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: priceController,
                        labeltxt: "Ad Price*",
                        helper: "Price",
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Bachelors Allowed",
                        style: GoogleFonts.dmSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(153, 0, 0, 0),
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 190.w,
                            height: 53.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: Color.fromARGB(153, 0, 0, 0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "No",
                                style: GoogleFonts.dmSans(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(153, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 190.w,
                            height: 53.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: Color.fromARGB(153, 0, 0, 0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Yes",
                                style: GoogleFonts.dmSans(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(153, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FormBody(
                        labeltxt: "Maintenance (Monthly)",
                        controller: mentationController,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        controller: florControlelr,
                        labeltxt: "Total Floors",
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        controller: florNumberControler,
                        labeltxt: "Floor No",
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Car Parking",
                        controller: carparkingContrller,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Facing", controller: facingcontroler),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Project Name",
                        controller: proejctnameControler,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        controller: titleControler,
                        labeltxt: "Ad title*",
                        helper:
                            "Mention the key features of your item (eg. brand, model 0/70 age, type)",
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        controller: desContrler,
                        labeltxt: "Describe what you are selling*",
                        helper:
                            "Include condition, features and reason for selling\nRequired Fields",
                        maxlenghts: 4096,
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          showImage();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 216.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.w),
                          ),
                          child:
                              image == null
                                  ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.upload),
                                      Text("Upload Image"),
                                    ],
                                  )
                                  : ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    child: Image.file(
                                      image!,
                                      width: MediaQuery.of(context).size.width,
                                      height: 216.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            49.h,
                          ),
                          backgroundColor: Color.fromARGB(255, 137, 26, 255),
                        ),
                        onPressed: () async {
                          try {
                            setState(() {});
                            final apiserce = APIService(await createDio());
                            await apiserce.addProduct({
                              "category": "tet",
                              "user_id": "${box.get("id")}",
                              "image": await MultipartFile.fromFile(
                                image!.path,
                                filename: image!.path.split('/').last,
                              ),
                              "latitude": location.lat,
                              "longitude": location.long,

                              "price": priceController.text,
                              "json_data": jsonEncode({
                                "type": typeContrller.text,
                                "bhk": bhkController.text,
                                "bathroo": bathroomController.text,
                                "frun": furshingController.text,
                                "project": projectControler.text,
                                "listed": listedControlelr.text,
                                "super": superbuildController.text,
                                "car": carpetControlelr.text,
                                "main": mentationController.text,
                                "flor": florControlelr.text,
                                "flornumber": florNumberControler.text,
                                "carparking": carparkingContrller.text,
                                "facing": facingcontroler.text,
                                "projectname": proejctnameControler.text,
                                "title": titleControler.text,
                                "des": desContrler.text,
                              }),
                            });
                            Fluttertoast.showToast(
                              msg: "Product Add Successfull",
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false,
                            );
                          } catch (e) {
                            log(e.toString());
                            setState(() {});
                            Fluttertoast.showToast(msg: "Product Add Failed");
                          }
                          final service = APIService(await createDio());
                          await service.addProduct(data);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => NewPlanPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Continue",
                          style: GoogleFonts.dmSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
