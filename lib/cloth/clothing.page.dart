import 'dart:convert';

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/cloth/model/categoryBodyModel.dart';
import 'package:shopping_app_olx/cloth/service/categoryController.dart';

class ClothingPage extends ConsumerStatefulWidget {
  const ClothingPage({super.key});

  @override
  ConsumerState<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends ConsumerState<ClothingPage> {
  List<Map<String, String>> clothsList = [
    {
      "imageUrl": "assets/1.png",
      "location": "Udaipur, rajasthan",
      "title": "Nike Air Jorden 55 Medium",
      "price": "\$450.00",
    },
    {
      "imageUrl": "assets/2.png",
      "location": "Jaipur, Rajasthan",
      "title": "Adidas Ultraboost 21",
      "price": "\$180.00",
    },
    {
      "imageUrl": "assets/3.png",
      "location": "Mumbai, Maharashtra",
      "title": "Puma RS-X3",
      "price": "\$120.00",
    },
    {
      "imageUrl": "assets/4.png",
      "location": "Bengaluru, Karnataka",
      "title": "Reebok Nano X1",
      "price": "\$140.00",
    },
    {
      "imageUrl": "assets/5.png",
      "location": "Delhi",
      "title": "Under Armour Charged Escape 3",
      "price": "\$450.00",
    },
    {
      "imageUrl": "assets/6.png",
      "location": "Udaipur, rajasthan",
      "title": "Nike Air Jorden 55 Medium",
      "price": "\$110.00",
    },
    {
      "imageUrl": "assets/7.png",
      "location": "Chennai, Tamil Nadu",
      "title": "New Balance Fresh Foam 1080v11",
      "price": "\$160.00",
    },
    {
      "imageUrl": "assets/8.png",
      "location": "Ahmedabad, Gujarat",
      "title": "Asics Gel-Kayano 27",
      "price": "\$200.00",
    },
    {
      "imageUrl": "assets/9.png",
      "location": "Udaipur, rajasthan",
      "title": "Hoka One One Clifton 7",
      "price": "\$180.00",
    },
    {
      "imageUrl": "assets/10.png",
      "location": "Pune, Maharashtra",
      "title": "Nike Air Jorden 55 Medium",
      "price": "\$450.00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final dataProvider = ref.watch(
      categoryController(CategoryBodyModel(category: "Electronics")),
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 247),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 54.h),
          Row(
            children: [
              SizedBox(width: 20.w),
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
              SizedBox(width: 10.w),
              Expanded(
                child: SizedBox(
                  height: 46.h,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(40.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(40.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Clothing",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // FilterBody(name: "Category"),
                // FilterBody(name: "Price"),
                // FilterBody(name: "Recently Posted"),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          dataProvider.when(
            data: (data) {
              return Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: data.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final cate = data.data[index];
                    final Map<String, dynamic> jsonDetails = jsonDecode(
                      cate.jsonData,
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.network(
                                // "assets/shoes1.png",
                                //clothsList[index]["imageUrl"].toString(),
                                //productcategory.data[index].image,
                                data.data[index].image,
                                width: 196.w,
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
                          width: 155.w,
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
                                  //clothsList[index]["location"].toString(),
                                  //productcategory.data[index].address,
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
                          // "Nike Air Jorden 55 Medium",
                          //clothsList[index]["title"].toString(),
                          // productcategory.data[index].name,
                          jsonDetails['name'].toString(),
                          style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 97, 91, 104),
                            letterSpacing: -0.80,
                          ),
                        ),
                        Text(
                          //"\$450.00",
                          //clothsList[index]["price"].toString(),
                          // productcategory.data[index].price.toString(),
                          jsonDetails['price'].toString(),
                          style: GoogleFonts.dmSans(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text(e.toString())),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

class FilterBody extends StatefulWidget {
  final String name;
  const FilterBody({super.key, required this.name});

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 130.w,
      height: 34.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.45.r),
        border: Border.all(color: Color.fromARGB(255, 97, 91, 104)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        child: Row(
          children: [
            Text(
              widget.name,
              style: GoogleFonts.dmSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 97, 91, 104),
              ),
            ),
            SizedBox(width: 20.w),
            Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 97, 91, 104),
            ),
          ],
        ),
      ),
    );
  }
}
