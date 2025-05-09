import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopping_app_olx/edit/updateController.dart';
import 'package:shopping_app_olx/register/register.page.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  bool isUpdate = false;

  File? image;
  final picker = ImagePicker();

  Future pickImageFromCamera() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.camera);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      log("Camera Permission denied");
    }
  }

  Future pickImageFromGallery() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      log(" Gallery Permission denied");
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
                  Navigator.pop(context);
                  pickImageFromGallery();
                },
                child: Text("Gallery"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  pickImageFromCamera();
                },
                child: Text("Camera"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
                ),
              ),
            ),
            Image.asset("assets/bgimage.png"),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 60.h),
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
            Positioned(
              top: 150.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "Edit Your Profile",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp,
                          color: Color(0xFF242126),
                          letterSpacing: -0.65,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    RegisterBody(
                      title: "Name",
                      controller: nameController,
                      type: TextInputType.text,
                    ),
                    SizedBox(height: 30.h),
                    GestureDetector(
                      onTap: () {
                        showImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                        ),
                        child:
                            image == null
                                ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_upload_outlined,
                                      color: Color.fromARGB(255, 137, 26, 255),
                                      size: 30.sp,
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "Upload your image",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 97, 91, 104),
                                      ),
                                    ),
                                    Text(
                                      "PNG, JPG are supported with 5mb limit",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(
                                          255,
                                          119,
                                          112,
                                          128,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                : ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Image.file(image!, fit: BoxFit.cover),
                                ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () async {
                        try {
                          setState(() {
                            isUpdate = true;
                          });

                          final Update = await UpdateController.UpdateProfile(
                            user_id: box.get("id").toString(),
                            full_name: nameController.text,
                            images: image!, context: context,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Update Failed : ${e.toString()}"),
                            ),
                          );
                          setState(() {
                            isUpdate = false;
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
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child:
                              isUpdate == false
                                  ? Text(
                                    "Next",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 137, 26, 255),
                                    ),
                                  )
                                  : CircularProgressIndicator(
                                    color: Color.fromARGB(255, 137, 26, 255),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
