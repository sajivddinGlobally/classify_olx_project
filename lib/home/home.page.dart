import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 228, 250),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
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
                      Row(
                        children: [
                          SizedBox(width: 20.w),
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: Color(0xFF891AFF),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Location",
                                style: GoogleFonts.dmSans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 97, 91, 104),
                                ),
                              ),
                              Text(
                                "Jaipur, rajasthan",
                                style: GoogleFonts.dmSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 137, 26, 255),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(child: Icon(Icons.favorite_border)),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(Icons.notifications_none),
                            ),
                          ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: SizedBox(
                          height: 50.h,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: 8.h,
                                right: 20.r,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search Anything...",
                              hintStyle: GoogleFonts.dmSans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 97, 91, 104),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectBody(
                                    image: "assets/clothing.png",
                                    text: "Clothing ",
                                  ),
                                  SelectBody(
                                    image: "assets/electronic.png",
                                    text: "Electronics ",
                                  ),
                                  SelectBody(
                                    image: "assets/furniture.png",
                                    text: "Furniture ",
                                  ),
                                  SelectBody(
                                    image: "assets/car.png",
                                    text: "Vehicles ",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        height: 180.h,
                        child: CarouselSlider(
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          slideTransform: DefaultTransform(),
                          autoSliderTransitionTime: Duration(seconds: 1),
                          autoSliderDelay: Duration(seconds: 2),
                          enableAutoSlider: true,
                          //slideIndicator: CircularSlideIndicator(),
                          unlimitedMode: true,
                          children: [
                            Image.asset('assets/frame.png'),
                            Image.asset('assets/frame1.png'),
                            Image.asset('assets/frame2.png'),
                            Image.asset("assets/frame3.png"),
                            Image.asset("assets/frame4.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Deal",
                    style: GoogleFonts.dmSans(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 36, 33, 38),
                    ),
                  ),
                  Container(
                    width: 65.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.45.r),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Center(
                      child: Text(
                        "View all",
                        style: GoogleFonts.dmSans(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 97, 91, 104),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 21.h, left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.asset(
                                "assets/shoes1.png",
                                width: 240.w,
                                height: 160.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 15.w,
                              top: 15.h,
                              child: Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          width: 135.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: Color.fromARGB(25, 137, 26, 255),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15.sp,
                                  color: Color.fromARGB(255, 137, 26, 255),
                                ),
                                Text(
                                  "Udaipur, rajasthan",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 137, 26, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Nike Air Jorden 55 Medium",
                          style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 97, 91, 104),
                            letterSpacing: -0.80,
                          ),
                        ),
                        Text(
                          "\$450.00",
                          style: GoogleFonts.dmSans(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectBody extends StatefulWidget {
  final String image;
  final String text;
  const SelectBody({super.key, required this.image, required this.text});

  @override
  State<SelectBody> createState() => _SelectBodyState();
}

class _SelectBodyState extends State<SelectBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54.w,
          height: 54.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 246, 245, 250),
          ),
          child: Image.asset(widget.image),
        ),
        Text(
          widget.text,
          style: GoogleFonts.dmSans(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 97, 91, 104),
          ),
        ),
      ],
    );
  }
}
