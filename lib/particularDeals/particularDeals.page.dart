import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/particularDeals/service/particularProductController.dart';

class ParticularDealsPage extends ConsumerStatefulWidget {
  final String id;
  const ParticularDealsPage({super.key, required this.id});

  @override
  ConsumerState<ParticularDealsPage> createState() =>
      _ParticularDealsPageState();
}

class _ParticularDealsPageState extends ConsumerState<ParticularDealsPage> {
  @override
  Widget build(BuildContext context) {
    final particulerProduct = ref.watch(particularController(widget.id));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 247),
      body: particulerProduct.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      // "assets/particular.png",
                      data.data.images[0].imageUrl,
                      width: MediaQuery.of(context).size.width,
                      height: 440.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 60.h,
                      left: 20.w,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
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
                                child: Center(child: Icon(Icons.arrow_back)),
                              ),
                            ),
                            Container(
                              width: 46.w,
                              height: 46.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(child: Icon(Icons.favorite_border)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Row(
                    children: [
                      Container(
                        // width: 135.w,
                        height: 26.h,
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
                      Spacer(),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(25, 137, 26, 255),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 15.sp,
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "Nike Air Jorden 55 Medium",
                        data.data.name,
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 97, 91, 104),
                        ),
                      ),
                      Text(
                        // "\$450.00",
                        data.data.price.toString(),
                        style: GoogleFonts.dmSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 137, 26, 255),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "Product Specification ",
                        style: GoogleFonts.dmSans(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 36, 33, 38),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDesc(
                        name: "Model",
                        title: data.data.specification[0].model,
                        // "Nike Air Jordan 55 Medium",
                      ),
                      ProductDesc(
                        name: "Upper Material",
                        title: data.data.specification[0].material,
                        // "Breathable mesh",
                      ),
                      ProductDesc(
                        name: "Cushioning Technology",
                        title: " Iconic Air cushioning",
                      ),
                      ProductDesc(
                        name: "Ideal For",
                        title: data.data.specification[0].idealFor,
                        //"Casual outings and athletic use",
                      ),
                      ProductDesc(
                        name: "Branding",
                        title: "Signature Air Jordan logo",
                      ),
                      ProductDesc(
                        name: "Style",
                        title: data.data.specification[0].style,
                        //"NSleek and stylish",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 255.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, top: 16.h),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  "assets/micheel.png",
                                  width: 110.w,
                                  height: 84.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Michael Keanu",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 97, 91, 104),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "+91-9812456578    |    Jaipur",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 137, 26, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            top: 15.h,
                          ),
                          child: Text(
                            "Hi, I'm Michael Keanu, a passionate traveler and adventure seeker. I love exploring new cultures and capturing moments through my photography.",
                            style: GoogleFonts.dmSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 97, 91, 104),
                              letterSpacing: -0.60,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.r),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 49.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.45.r),
                              border: Border.all(
                                color: Color.fromARGB(255, 137, 26, 255),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Message me",
                                style: GoogleFonts.dmSans(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 137, 26, 255),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.r),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 49.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 137, 26, 255),
                      borderRadius: BorderRadius.circular(35.45.r),
                    ),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: GoogleFonts.dmSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ProductDesc extends StatelessWidget {
  final String name;
  final String title;
  const ProductDesc({super.key, required this.name, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.dmSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 97, 91, 104),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.dmSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 97, 91, 104),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Divider(),
      ],
    );
  }
}
