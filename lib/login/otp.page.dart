import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otpify/otpify.dart';
import 'package:shopping_app_olx/home/home.page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height + 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
                ),
              ),
            ),
            Image.asset("assets/bgimage.png"),
            Positioned.fill(
              top: 150.h,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity, // ya specific width
                    height: 350.h, // aapki desired height
                    child: Center(
                      child: Image.asset(
                        "assets/otpimage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Center(
                    child: Text(
                      "Enter OTP",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 26.sp,
                        color: Color(0xFF242126),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 44.w, right: 44.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Enter your OTP send to your number your provided",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xFF615B68),
                        letterSpacing: -0.75,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Which is",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xFF615B68),
                          letterSpacing: -0.75,
                        ),
                      ),
                      Text(
                        "+91-8978456532",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xFF891AFF),
                          letterSpacing: -0.75,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 40.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Otpify(
                        focusedBorderColor: Color(0xFF891AFF),
                        fields: 4,
                        fieldColor: Colors.white,
                        width: 60.w,
                        height: 50.w,
                        borderRadius: BorderRadius.circular(35.r),
                        borderColor: Colors.white,
                        resendSecond: 10,
                        showResendButton: false,
                        fieldTextStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: ElevatedButton(
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
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: Text(
                            "Verify",
                            style: GoogleFonts.dmSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Edit your number?",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF615B68),
                            ),
                          ),
                          Text(
                            " Edit Number",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF891AFF),
                            ),
                          ),
                        ],
                      ),
                    ],
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
