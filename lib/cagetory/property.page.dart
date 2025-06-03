import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  @override
  Widget build(BuildContext context) {
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
                  "Properties",
                  style: GoogleFonts.dmSans(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  children: [
                    PropertyBody(txt: "For Sale: Houses & Apartment"),
                    SizedBox(height: 10.h),
                    PropertyBody(txt: "For Rent: Houses & Apartment"),
                    SizedBox(height: 10.h),
                    PropertyBody(txt: "Lands & Plots"),
                    SizedBox(height: 10.h),
                    PropertyBody(txt: "For Rent : Shops & Offices"),
                    SizedBox(height: 10.h),
                    PropertyBody(txt: "For Sale : Shops & Offices"),
                    SizedBox(height: 10.h),
                    PropertyBody(txt: "PG & Guest Houses"),
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

class PropertyBody extends StatelessWidget {
  final String txt;
  const PropertyBody({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: GoogleFonts.dmSans(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF615B68),
          ),
        ),
        Divider(color: Colors.black12),
      ],
    );
  }
}
