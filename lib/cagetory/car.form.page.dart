import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/home/home.page.dart';
import 'package:shopping_app_olx/new/new.service.dart';

class CarFormPage extends ConsumerStatefulWidget {
  const CarFormPage({super.key});

  @override
  ConsumerState<CarFormPage> createState() => _CarFormPageState();
}

class _CarFormPageState extends ConsumerState<CarFormPage> {
  final carControlelr = TextEditingController();
  final fuelControlelr = TextEditingController();
  final yearController = TextEditingController();
  final kmDrivenController = TextEditingController();
  final ownerControleller = TextEditingController();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final pinCodeController = TextEditingController();

  bool isloading = false;

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

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");

    Map<String, dynamic> data = {
      "car": carControlelr.text,
      "year": yearController.text,
      "fuel": fuelControlelr.text,
      "kmDriven": kmDrivenController.text,
      "owner": ownerControleller.text,
      "title": titleController.text,
      "desc": descController.text,
      "price": priceController.text,
      "picCode": pinCodeController.text,
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
            Positioned(
              child: Column(
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
                    child: Column(
                      children: [
                        Text(
                          "Include some details",
                          style: GoogleFonts.dmSans(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBody(labeltxt: "Car*", controller: carControlelr),
                        SizedBox(height: 10.h),
                        FormBody(
                          controller: yearController,
                          labeltxt: 'Year*',
                          helper: "Year has a minimum value of 1990.",
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 10.h),
                        FormBody(labeltxt: 'Fuel*', controller: fuelControlelr),
                        SizedBox(height: 15.h),
                        // Text(
                        //   "Transmission",
                        //   style: GoogleFonts.dmSans(
                        //     fontSize: 18.sp,
                        //     fontWeight: FontWeight.w500,
                        //     color: Color.fromARGB(153, 0, 0, 0),
                        //     letterSpacing: -0.5,
                        //   ),
                        // ),
                        // SizedBox(height: 15.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       width: 190.w,
                        //       height: 53.h,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(5.r),
                        //         border: Border.all(
                        //           color: Color.fromARGB(153, 0, 0, 0),
                        //         ),
                        //       ),
                        //       child: Center(
                        //         child: Text(
                        //           "Automatic",
                        //           style: GoogleFonts.dmSans(
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.w400,
                        //             color: Color.fromARGB(153, 0, 0, 0),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: 190.w,
                        //       height: 53.h,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(5.r),
                        //         border: Border.all(
                        //           color: Color.fromARGB(153, 0, 0, 0),
                        //         ),
                        //       ),
                        //       child: Center(
                        //         child: Text(
                        //           "Automatic",
                        //           style: GoogleFonts.dmSans(
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.w400,
                        //             color: Color.fromARGB(153, 0, 0, 0),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 10.h),
                        FormBody(
                          labeltxt: 'KM driven *',
                          maxlenghts: 6,
                          controller: kmDrivenController,
                        ),
                        SizedBox(height: 4.h),
                        FormBody(
                          controller: ownerControleller,
                          labeltxt: "No.of Owners*",
                          type: TextInputType.number,
                          maxlenghts: 10,
                          isCounter: '',
                        ),
                        SizedBox(height: 10.h),
                        FormBody(
                          labeltxt: "Ad title *",
                          controller: titleController,
                        ),
                        SizedBox(height: 10.h),
                        FormBody(
                          controller: descController,
                          labeltxt: "Describe what you are selling *",
                          helper:
                              'Include condition, features and reason for selling\nRequired Fields',
                          maxlenghts: 4096,
                        ),
                        SizedBox(height: 10.h),
                        FormBody(
                          labeltxt: "Price*",
                          controller: priceController,
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 10.h),
                        FormBody(
                          labeltxt: "Pin Code*",
                          controller: pinCodeController,
                          type: TextInputType.number,
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
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.w,
                              ),
                            ),
                            child:
                                image == null
                                    ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.upload),
                                        Text("Upload Image"),
                                      ],
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: Image.file(
                                        image!,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 216.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: 40.h),
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
                              setState(() {
                                isloading = true;
                              });
                              log("Car : ${carControlelr.text}");
                              log("YEAR : ${yearController.text}");
                              log("fuel : ${fuelControlelr.text}");
                              log("km : ${kmDrivenController.text}");
                              log("owner : ${ownerControleller.text}");
                              log("title : ${titleController.text}");
                              log("Price : ${priceController.text}");
                              log("PinCode : ${pinCodeController.text}");

                              final apiserce = APIService(await createDio());
                              await apiserce.addProduct({
                                "category": "test",
                                "user_id": "${box.get("id")}",
                                "image": await MultipartFile.fromFile(
                                  image!.path,
                                  filename: image!.path.split('/').last,
                                ),
                                "json_data": jsonEncode({
                                  "car": carControlelr.text,
                                  "Year": yearController.text,
                                  "fuel": fuelControlelr.text,
                                  "ko": kmDrivenController.text,
                                  "owner": ownerControleller.text,
                                  "title": titleController.text,
                                  "Des": descController.text,
                                  "price": priceController.text,
                                  "pinCode": pinCodeController.text,
                                }),
                              });
                              Fluttertoast.showToast(
                                msg: "Product Add Successfull",
                              );
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => NewPlanPage(),
                              //   ),
                              // );
                              Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                                (route) => false,
                              );
                            } catch (e) {
                              log(e.toString());
                              setState(() {
                                isloading = false;
                              });
                              Fluttertoast.showToast(msg: "Product Add Failed");
                            }
                          },
                          child: Center(
                            child:
                                isloading == false
                                    ? Text(
                                      "Continue",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    )
                                    : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormBody extends StatelessWidget {
  final String labeltxt;
  final String? helper;
  final int? maxlenghts;
  final TextEditingController controller;
  final TextInputType? type;
  final String? isCounter;
  const FormBody({
    super.key,
    required this.labeltxt,
    this.helper,
    this.maxlenghts,
    this.type,
    this.isCounter,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: type,
          maxLength: maxlenghts,
          decoration: InputDecoration(
            counterText: isCounter,
            contentPadding: EdgeInsets.zero,
            hintStyle: GoogleFonts.dmSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF615B68),
            ),
            labelText: labeltxt,
            labelStyle: GoogleFonts.dmSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF615B68),
              letterSpacing: -1,
            ),
            helperText: helper,
            helperStyle: GoogleFonts.dmSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(127, 0, 0, 0),
              letterSpacing: -0.5,
            ),
          ),
        ),
      ],
    );
  }
}
