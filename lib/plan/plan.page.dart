import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height + 100,
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
              top: 100.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Paid Plan",
                        style: GoogleFonts.dmSans(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 33, 36, 38),
                        ),
                      ),
                    ),
                    DefaultTabController(
                      length: 2,
                      child: TabBar(
                        dividerColor: Color.fromARGB(255, 137, 25, 255),
                        dividerHeight: 1.w,
                        unselectedLabelColor: Color.fromARGB(255, 30, 30, 30),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                        indicatorWeight: 6.w,
                        indicatorColor: Color.fromARGB(255, 137, 25, 255),
                        tabs: [
                          Tab(
                            child: Text(
                              "Single Listing ",
                              style: GoogleFonts.dmSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 137, 25, 255),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Multiple Listing ",
                              style: GoogleFonts.dmSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 30, 30, 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      children: [
                        PlanBody(
                          bgColor: Colors.white,
                          plan: Colors.black,
                          month: Colors.black,
                          name: Colors.black,
                          title: Colors.black,
                        ),
                        SizedBox(height: 10.h),
                        PlanBody(
                          bgColor: Color.fromARGB(255, 137, 25, 255),
                          plan: Colors.white,
                          month: Colors.white,
                          name: Colors.white,
                          title: Colors.white,
                        ),
                        SizedBox(height: 10.h),
                        PlanBody(
                          bgColor: Colors.white,
                          plan: Colors.black,
                          month: Colors.black,
                          name: Colors.black,
                          title: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Ads Visibility ",
                      style: GoogleFonts.dmSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 33, 36, 38),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 106.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FeatureBody(txt: "15 days listing for Free Plan"),
                            FeatureBody(txt: "30 days listing for Paid Plan"),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 49.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.45.r),
                        color: Color.fromARGB(255, 137, 26, 255),
                      ),
                      child: Center(
                        child: Text(
                          "Upgrade to this plan",
                          style: GoogleFonts.dmSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
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

class PlanBody extends StatefulWidget {
  final Color bgColor;
  final Color plan;
  final Color month;
  final Color name;
  final Color title;

  const PlanBody({
    super.key,
    required this.bgColor,
    required this.plan,
    required this.month,
    required this.name,
    required this.title,
  });

  @override
  State<PlanBody> createState() => _PlanBodyState();
}

class _PlanBodyState extends State<PlanBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 166.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: widget.bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.dmSans(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: widget.plan,
                ),
                children: [
                  TextSpan(text: '₹1540.00/'),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Text(
                      'month',
                      style: GoogleFonts.dmSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: widget.month,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Silver Plan",
              style: GoogleFonts.dmSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: widget.name,
              ),
            ),
            Text(
              "Include one city where you can easily buy and sell items on this platform. ",
              style: GoogleFonts.dmSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: widget.title,
                letterSpacing: -0.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureBody extends StatefulWidget {
  final String txt;
  const FeatureBody({super.key, required this.txt});

  @override
  State<FeatureBody> createState() => _FeatureBodyState();
}

class _FeatureBodyState extends State<FeatureBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: Color.fromARGB(255, 97, 91, 104)),
        SizedBox(width: 10.w),
        SizedBox(
          width: 330.w,
          child: Text(
            overflow: TextOverflow.ellipsis,
            widget.txt,
            style: GoogleFonts.dmSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 97, 91, 104),
            ),
          ),
        ),
      ],
    );
  }
}
