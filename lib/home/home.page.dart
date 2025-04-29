import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    SizedBox(height: 54.h),
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
                          child: Center(child: Icon(Icons.notifications_none)),
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
                    SizedBox(
                      child: Padding(
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
                    ),
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
