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
        child: Column(
          children: [
            Stack(
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
                        SizedBox(height: 40.h),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 191.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 30.w,
                              right: 30.w,
                              top: 30.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.dmSans(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          TextSpan(text: '₹1540.00/'),
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.baseline,
                                            baseline: TextBaseline.alphabetic,
                                            child: Text(
                                              'month',
                                              style: GoogleFonts.dmSans(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 88.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/vector.png"),
                                          SizedBox(width: 6.w),
                                          Text(
                                            "Premium",
                                            style: GoogleFonts.dmSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                255,
                                                213,
                                                139,
                                                29,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.h),
                                Text(
                                  "All-in-one Plan",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Discover amazing deals and connect with local sellers effortlessly. Your next great find is just a click away!",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          "Feature & Benefits",
                          style: GoogleFonts.dmSans(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 33, 36, 38),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FeatureBody(
                                  txt: "Get 5x more views on your listings",
                                ),
                                FeatureBody(
                                  txt: "Appear at the top of search results",
                                ),
                                SizedBox(height: 10.h),
                                FeatureBody(
                                  txt: "Highlighted ad tag for extra attention",
                                ),
                                SizedBox(height: 10.h),
                                FeatureBody(
                                  txt: "Real-time insights on ad performance",
                                ),
                                SizedBox(height: 10.h),
                                FeatureBody(
                                  txt:
                                      "Priority support for faster issue resolution",
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          "Ideal For",
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
                                FeatureBody(
                                  txt:
                                      "Sellers who want to close deals quickly",
                                ),
                                SizedBox(height: 10.h),
                                FeatureBody(
                                  txt:
                                      "Businesses looking to promote multiple products",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
