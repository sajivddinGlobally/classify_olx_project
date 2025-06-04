import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/listing/service/getlistingController.dart';
import 'package:shopping_app_olx/plan/reting.page.dart';

class ListingPage extends ConsumerStatefulWidget {
  const ListingPage({super.key});

  @override
  ConsumerState<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends ConsumerState<ListingPage> {
  List<Map<String, String>> listingList = [
    {"imageUrl": "assets/listingimage.png"},
    {"imageUrl": "assets/listingimage2.png"},
  ];
  @override
  Widget build(BuildContext context) {
    final listingProvider = ref.watch(listingController);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 247),
      body: listingProvider.when(
        data: (listing) {
          return Column(
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
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: listing.data.sellList.length,
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = listing.data.sellList[index];
                    final Map<String, dynamic> jsonDetails = jsonDecode(
                      data.jsonData,
                    );
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => RetingPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 20.h,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 216.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                              top: 12.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.network(
                                    // "assets/listingimage.png",
                                    // listingList[index]["imageUrl"].toString(),
                                    listing.data.sellList[index].image
                                        .toString(),
                                    width: MediaQuery.of(context).size.width,
                                    height: 133.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  // "Raymond's Silk Shirts with red coller",
                                  jsonDetails['description'].toString(),
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 97, 91, 104),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // "\$250.00",
                                      "\$${jsonDetails['price'].toString()}",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(
                                          255,
                                          137,
                                          26,
                                          255,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 78.w,
                                      height: 29.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                        color: Color.fromARGB(25, 137, 26, 255),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: Color.fromARGB(
                                              255,
                                              137,
                                              26,
                                              255,
                                            ),
                                            size: 15.sp,
                                          ),
                                          Text(
                                            "Edit Ad",
                                            style: GoogleFonts.dmSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                255,
                                                137,
                                                26,
                                                255,
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => Center(child: Text(e.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
