import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/product/productRegister.page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                SizedBox(height: 100.h),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Choose your category",
                        style: GoogleFonts.dmSans(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 44.w, right: 44.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Select one of the categories to post your ad on, start with selecting category",
                          style: GoogleFonts.dmSans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                CategorBody(
                  bgColor: Colors.white,
                  image: 'assets/clothing.png',
                  txt: 'Clothing',
                  txtColor: Color.fromARGB(255, 97, 91, 104),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProductRegisterPage(),
                      ),
                    );
                  },
                  child: CategorBody(
                    bgColor: Color.fromARGB(255, 137, 26, 255),
                    image: 'assets/electronic.png',
                    txt: 'Electronic',
                    txtColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 8.h),
                CategorBody(
                  bgColor: Colors.white,
                  image: 'assets/furniture.png',
                  txt: 'Furniture',
                  txtColor: Color.fromARGB(255, 97, 91, 104),
                ),
                SizedBox(height: 8.h),
                CategorBody(
                  bgColor: Colors.white,
                  image: 'assets/car.png',
                  txt: 'Vehicles',
                  txtColor: Color.fromARGB(255, 97, 91, 104),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorBody extends StatelessWidget {
  final Color bgColor;
  final String image;
  final String txt;
  final Color txtColor;
  const CategorBody({
    super.key,
    required this.bgColor,
    required this.image,
    required this.txt,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            Text(
              txt,
              style: GoogleFonts.dmSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: txtColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
