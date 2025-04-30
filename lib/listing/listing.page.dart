import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 247),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Listing",
                style: GoogleFonts.dmSans(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 36, 33, 38),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 216.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        "assets/listingimage.png",
                        width: MediaQuery.of(context).size.width,
                        height: 133.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Raymond's Silk Shirts with red coller",
                      style: GoogleFonts.dmSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 97, 91, 104),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$250.00",
                          style: GoogleFonts.dmSans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),
                        ),
                        Container(
                          width: 78.w,
                          height: 29.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            color: Color.fromARGB(25, 137, 26, 255),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 137, 26, 255),
                                size: 15.sp,
                              ),
                              Text(
                                "Edit Ad",
                                style: GoogleFonts.dmSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 137, 26, 255),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
