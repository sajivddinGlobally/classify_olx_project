import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/cagetory/new.plan.page.dart';

class CarFormPage extends StatefulWidget {
  const CarFormPage({super.key});

  @override
  State<CarFormPage> createState() => _CarFormPageState();
}

class _CarFormPageState extends State<CarFormPage> {
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
                        FormBody(labeltxt: "Car*"),
                        SizedBox(height: 10.h),
                        FormBody(
                          labeltxt: 'Year*',
                          helper: "Year has a minimum value of 1990.",
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 10.h),
                        FormBody(labeltxt: 'Fuel*'),
                        SizedBox(height: 15.h),
                        Text(
                          "Transmission",
                          style: GoogleFonts.dmSans(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(153, 0, 0, 0),
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 15.h),
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
                                  "Automatic",
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
                                  "Automatic",
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
                        SizedBox(height: 10.h),
                        FormBody(labeltxt: 'KM driven *', maxlenghts: 6),
                        SizedBox(height: 4.h),
                        FormBody(
                          labeltxt: "No.of Owners*",
                          type: TextInputType.number,
                          maxlenghts: 10,
                          isCounter: '',
                        ),
                        SizedBox(height: 10.h),
                        FormBody(labeltxt: "Ad title *"),
                        SizedBox(height: 10.h),
                        FormBody(
                          labeltxt: "Describe what you are selling *",
                          helper:
                              'Include condition, features and reason for selling\nRequired Fields',
                          maxlenghts: 4096,
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
                          onPressed: () {
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
  final TextInputType? type;
  final String? isCounter;
  const FormBody({
    super.key,
    required this.labeltxt,
    this.helper,
    this.maxlenghts,
    this.type,
    this.isCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
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
