import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/cagetory/car.form.page.dart';

class RentPropertyFormPage extends StatefulWidget {
  const RentPropertyFormPage({super.key});

  @override
  State<RentPropertyFormPage> createState() => _RentPropertyFormPageState();
}

class _RentPropertyFormPageState extends State<RentPropertyFormPage> {
  @override
  Widget build(BuildContext context) {
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
                      FormBody(labeltxt: "Type*"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "BHK"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Bathrooms"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Furnishing"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Project Status"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Listed by"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Super Builtup area sqft*"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Carpet Area sqft*"),

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
                      FormBody(labeltxt: "Maintenance (Monthly)"),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Total Floors",
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Floor No",
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Car Parking"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Facing"),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Project Name"),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Ad title*",
                        helper:
                            "Mention the key features of your item (eg. brand, model 0/70 age, type)",
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Describe what you are selling*",
                        helper:
                            "Include condition, features and reason for selling\nRequired Fields",
                        maxlenghts: 4096,
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
                        onPressed: () async {},
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
