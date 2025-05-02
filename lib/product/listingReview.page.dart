import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingReviewPage extends StatefulWidget {
  const ListingReviewPage({super.key});

  @override
  State<ListingReviewPage> createState() => _ListingReviewPageState();
}

class _ListingReviewPageState extends State<ListingReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 360.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/reviewimage.png",
                        height: 145.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Your Listing is Under Review",
                        style: GoogleFonts.dmSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 36, 33, 38),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, right: 24.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "We are reviewing your order and we’ll let you know once your order is listed on our app",
                          style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 97, 91, 104),
                            letterSpacing: -0.50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 10.h,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              49.h,
                            ),
                            backgroundColor: Color(0xFF8D3AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Back to home",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
