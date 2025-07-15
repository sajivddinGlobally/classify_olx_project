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
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/home/home.page.dart';
import 'package:shopping_app_olx/map/map.page.dart';
import 'package:shopping_app_olx/new/new.service.dart';

class JobSeekerFormPage extends StatefulWidget {
  const JobSeekerFormPage({super.key});

  @override
  State<JobSeekerFormPage> createState() => _JobSeekerFormPageState();
}

class _JobSeekerFormPageState extends State<JobSeekerFormPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final preferredLocationController = TextEditingController();
  final skillsController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final salaryController = TextEditingController();

  List<File> images = [];
  final picker = ImagePicker();

  Future<void> pickImageFromCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          images.add(File(pickedFile.path));
        });
      }
    } else {
      print("Camera Permission is denied");
    }
  }

  Future<void> pickImagesFromGallery() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      final pickedFiles = await picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        setState(() {
          images.addAll(pickedFiles.map((e) => File(e.path)));
        });
      }
    } else {
      print("Gallery Permission is denied");
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
                  pickImageFromCamera();
                  Navigator.pop(context);
                },
                child: Text("Camera"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  pickImagesFromGallery();
                  Navigator.pop(context);
                },
                child: Text("Gallery"),
              ),
            ],
          ),
    );
  }

  bool loder = false;
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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");

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
                    textAlign: TextAlign.center,
                    "Job Seeker\nEnter Your Details",
                    style: GoogleFonts.dmSans(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: nameController,
                        labeltxt: "Full Name*",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: emailController,
                        labeltxt: "Email Address*",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: phoneController,
                        labeltxt: "Phone Number*",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: locationController,
                        labeltxt: "Current Location*",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: preferredLocationController,
                        labeltxt: "Preferred Job Location",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: skillsController,
                        labeltxt: "Skills*",
                        helper: "E.g., Python, Flutter, Communication",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: educationController,
                        labeltxt: "Highest Education*",
                        helper: "E.g., B.Sc. Computer Science - 2022",
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: experienceController,
                        labeltxt: "Work Experience",
                        helper: "E.g., 2 years at Infosys as Developer",
                        maxlenghts: 1000,
                      ),
                      SizedBox(height: 15.h),
                      FormBody(
                        controller: salaryController,
                        labeltxt: "Expected Salary",
                        helper: "In INR (e.g., 25000 per month)",
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Upload Resume Images (Optional)",
                        style: GoogleFonts.dmSans(fontSize: 14.sp),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          showImage();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.w),
                          ),
                          child:
                              images.isEmpty
                                  ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.upload),
                                      Text("Upload Images"),
                                    ],
                                  )
                                  : Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children:
                                        images.map((img) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            child: Image.file(
                                              img,
                                              width: 100.w,
                                              height: 100.h,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }).toList(),
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
                          setState(() {
                            loder = true;
                          });
                          final currentDate = DateTime.now();
                          final userid = box.get('id');
                          final date = box.get("postdate");
                          final planid = box.get("plan_id");
                          final latitude = box.get('latitude');
                          final longitude = box.get('longitude');
                          List<MultipartFile> multipartImages =
                              await Future.wait(
                                images.map((image) async {
                                  return await MultipartFile.fromFile(
                                    image.path,
                                    filename: image.path.split('/').last,
                                  );
                                }),
                              );
                          log(
                            {
                              "category": "Job seeker",
                              "user_id": "${box.get("id")}",
                              "images[]": multipartImages,
                              "price": salaryController.text,
                              "latitude": latitude,
                              "longitude": longitude,
                              "json_data": jsonEncode({
                                "full_name": nameController.text,
                                "email": emailController.text,
                                "phone": phoneController.text,
                                "current_location": locationController.text,
                                "preferred_location":
                                    preferredLocationController.text,
                                "skills": skillsController.text,
                                "education": educationController.text,
                                "experience": experienceController.text,
                              }),
                            }.toString(),
                          );
                          log(
                            "${currentDate.day}/${currentDate.month}/${currentDate.year}:::: $date",
                          );
                          if (date != null &&
                              date !=
                                  "${currentDate.day}/${currentDate.month}/${currentDate.year}") {
                            try {
                              final state = APIService(createDio());
                              final productAddResponse = await state.addProduct(
                                {
                                  "category": "Job seeker",
                                  "user_id": "${box.get("id")}",
                                  "images[]": multipartImages,
                                  "price": salaryController.text,
                                  "latitude": latitude,
                                  "longitude": longitude,
                                  "json_data": jsonEncode({
                                    "full_name": nameController.text,
                                    "email": emailController.text,
                                    "phone": phoneController.text,
                                    "current_location": locationController.text,
                                    "preferred_location":
                                        preferredLocationController.text,
                                    "skills": skillsController.text,
                                    "education": educationController.text,
                                    "experience": experienceController.text,
                                  }),
                                },
                              );
                              final response = await state.boostPost(
                                userid: userid.toString(),
                                planId: planid.toString(),
                                productId:
                                    productAddResponse
                                        .response
                                        .data["product"]["id"]
                                        .toString(),
                              );
                              if (response.response.data["status"] == true) {
                                await box.put(
                                  "postdate",
                                  "${currentDate.day}/${currentDate.month}/${currentDate.year}",
                                );
                                Fluttertoast.showToast(
                                  msg: "Boost succes fully",
                                );
                                setState(() {
                                  loder = false;
                                });
                              } else {
                                setState(() {
                                  loder = false;
                                });
                                Fluttertoast.showToast(
                                  msg:
                                      response.response.data["message"]
                                          .toString(),
                                );
                              }
                            } catch (e) {
                              setState(() {
                                loder = false;
                              });
                              Fluttertoast.showToast(
                                msg: "No active plan found.",
                              );
                            }
                          } else if (date == null) {
                            try {
                              final state = APIService(createDio());
                              final productAddResponse = await state.addProduct(
                                {
                                  "category": "Job seeker",
                                  "user_id": "${box.get("id")}",
                                  "images[]": multipartImages,
                                  "price": salaryController.text,
                                  "latitude": latitude,
                                  "longitude": longitude,
                                  "json_data": jsonEncode({
                                    "full_name": nameController.text,
                                    "email": emailController.text,
                                    "phone": phoneController.text,
                                    "current_location": locationController.text,
                                    "preferred_location":
                                        preferredLocationController.text,
                                    "skills": skillsController.text,
                                    "education": educationController.text,
                                    "experience": experienceController.text,
                                  }),
                                },
                              );

                              final response = await state.boostPost(
                                userid: userid.toString(),
                                planId: planid.toString(),
                                productId:
                                    productAddResponse
                                        .response
                                        .data["product"]["id"]
                                        .toString(),
                              );
                              if (response.response.data["status"] == true) {
                                setState(() {
                                  loder = false;
                                });
                                await box.put(
                                  "postdate",
                                  "${currentDate.day}/${currentDate.month}/${currentDate.year}",
                                );
                                Fluttertoast.showToast(
                                  msg: "Boost succes fully",
                                );
                              } else {
                                setState(() {
                                  loder = false;
                                });
                                Fluttertoast.showToast(
                                  msg:
                                      response.response.data["message"]
                                          .toString(),
                                );
                              }
                            } catch (e) {
                              setState(() {
                                loder = false;
                              });
                              Fluttertoast.showToast(
                                msg: "No active plan found.",
                              );
                            }
                          } else {
                            Fluttertoast.showToast(
                              msg: "Today post limit reache",
                            );
                          }
                        },
                        child:
                            loder
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  "Submit",
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
