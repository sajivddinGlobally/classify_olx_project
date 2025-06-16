import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping_app_olx/cagetory/car.form.page.dart';
import 'package:shopping_app_olx/cagetory/new.plan.page.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart' show createDio;
import 'package:shopping_app_olx/home/home.page.dart' show HomePage;
import 'package:shopping_app_olx/new/new.service.dart';

class FurnitureFormPage extends StatefulWidget {
  const FurnitureFormPage({super.key});

  @override
  State<FurnitureFormPage> createState() => _FurnitureFormPageState();
}

class _FurnitureFormPageState extends State<FurnitureFormPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

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

  bool isProperty = false;
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    Map<String, dynamic> data = {
      "title": titleController.text,
      "desc": descController.text,
    };
    return Scaffold(
      body: Stack(
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
                  "Furniture Include some details",
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
                    SizedBox(height: 15.h),
                    FormBody(
                      controller: titleController,
                      labeltxt: "Ad title*",
                      helper:
                          "Mention the key features of your item (eg. brand, model 0/70 age, type)",
                    ),
                    SizedBox(height: 15.h),
                    FormBody(
                      controller: descController,
                      labeltxt: "Describe what you are selling *",
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
                            isProperty = true;
                          });

                          final apiservice = APIService(createDio());
                          await apiservice.addProduct({
                            "category": "test",
                            "user_id": "${box.get("id")}",
                            "image": await MultipartFile.fromFile(
                              image!.path,
                              filename: image!.path.split("/").last,
                            ),
                            "data_json": jsonEncode({
                              "title": titleController.text,
                              "desc": descController.text,
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
                          setState(() {
                            isProperty = false;
                          });
                          Fluttertoast.showToast(msg: "Product Add Failed");
                        }
                      },
                      child: Center(
                        child:
                            isProperty == false
                                ? Text(
                                  "Continue",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                )
                                : Center(
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
        ],
      ),
    );
  }
}
