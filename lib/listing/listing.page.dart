import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/listing/service/getlistingController.dart';
import 'package:shopping_app_olx/new/new.service.dart';
import 'package:shopping_app_olx/particularDeals/particularDeals.page.dart';
import 'package:shopping_app_olx/plan/reting.page.dart';

class ListingPage extends ConsumerStatefulWidget {
  const ListingPage({super.key});

  @override
  ConsumerState<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends ConsumerState<ListingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => ref.invalidate(listingController));
  }

  @override
  Widget build(BuildContext context) {
    final listingProvider = ref.watch(listingController);
    final box = Hive.box("data");
    final planid = box.get("plan_id");
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
                    // final Map<String, dynamic> jsonDetails = jsonDecode(
                    //   data.jsonData,
                    // );
                    var jsondata =
                        listing.data.sellList[index].jsonData.entries.toList();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder:
                                (context) =>
                                    ParticularDealsPage(id: data.id.toString()),
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
                                    listing.data.sellList[index].image ?? "https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg"
                                        ,
                                    width: MediaQuery.of(context).size.width,
                                    height: 133.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  // "Raymond's Silk Shirts with red coller",
                                  jsondata[0].value.toString(),
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
                                      "₹ ${listing.data.sellList[index].price}",
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
        error: (error, stackTrace) {
          if (error is UserNotLoggedInException) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/login');
            });
          }
          return Center(child: Text("$error"));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
