import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app_olx/cagetory/choose.category.page.dart';
import 'package:shopping_app_olx/chat/chat.page.dart';
import 'package:shopping_app_olx/cloth/clothing.page.dart';
import 'package:shopping_app_olx/home/service/homepageController.dart';
import 'package:shopping_app_olx/like/model/likeBodyModel.dart';
import 'package:shopping_app_olx/like/service/likeController.dart';
import 'package:shopping_app_olx/like/showlike.page.dart';
import 'package:shopping_app_olx/listing/listing.page.dart';
import 'package:shopping_app_olx/login/login.page.dart';
import 'package:shopping_app_olx/map/map.page.dart';
import 'package:shopping_app_olx/map/service/locationController.dart';
import 'package:shopping_app_olx/particularDeals/particularDeals.page.dart';
import 'package:shopping_app_olx/profile/profile.page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<String> imageList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];
  List<Map<String, String>> dealsList = [
    {
      "imageUrl": "assets/shoes1.png",
      "location": "Udaipur, rajasthan",
      "title": "Nike Air Jorden 55 Medium",
      "price": "\$450.00",
    },
    {
      "imageUrl": "assets/shoes2.png",
      "location": "Mumbai, Maharashtra",
      "title": "Adidas Ultraboost 21",
      "price": "\$180.00",
    },
    {
      "imageUrl": "assets/shoes3.png",
      "location": "Delhi, India",
      "title": "Puma RS-X3",
      "price": "\$130.00",
    },
    {
      "imageUrl": "assets/shoes4.png",
      "location": "Bangalore, Karnataka",
      "title": "Reebok Classic Leather",
      "price": "\$75.00",
    },
    {
      "imageUrl": "assets/shoes5.png",
      "location": "Chennai, Tamil Nadu",
      "title": "New Balance 574",
      "price": "\$85.00",
    },
  ];

  final List<Map<String, dynamic>> categoryList = [
    {
      "icon": Icon(Icons.car_rental, color: Colors.blue.shade400),
      "title": "Cars",
    },
    {
      "icon": Icon(Icons.house_outlined, color: Colors.blue.shade400),
      "title": "Properties",
    },
    {
      "icon": Icon(Icons.mobile_friendly, color: Colors.blue.shade400),
      "title": "Mobies",
    },
    {
      "icon": Icon(Icons.badge_outlined, color: Colors.blue.shade400),
      "title": "Jobs",
    },
    {
      "icon": Icon(Icons.bike_scooter_outlined, color: Colors.blue.shade400),
      "title": "Bikes",
    },
    {
      "icon": Icon(Icons.tv_outlined, color: Colors.blue.shade400),
      "title": "Electronics",
    },
    {
      "icon": Icon(Icons.transform_outlined, color: Colors.blue.shade400),
      "title": "Commrcial",
    },
  ];

  int tabBottom = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = printCurrentLocation();
    var box = Hive.box("data");
    var token = box.get("token");
    final homepageData = ref.watch(homepageController);
    final categorProvider = ref.watch(allCategoryController);

    final locationAsyncValue = ref.watch(locationProvider);

    if (homepageData.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (homepageData.error != null) {
      print("/////////////////////");
      print(homepageData.error);
      return Scaffold(body: Center(child: Text("${homepageData.error}")));
    }
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 240, 228, 250),
      body:
          tabBottom == 0
              ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
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
                              Row(
                                children: [
                                  SizedBox(width: 20.w),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => MapPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
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
                                  ),
                                  SizedBox(width: 6.w),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => MapPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your Location",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                              255,
                                              97,
                                              91,
                                              104,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 220.w,
                                          //color: Colors.yellow,
                                          // child: Text(
                                          //   // "Jaipur, rajasthan",
                                          //   widget.address ?? "Jaipur rajsthan",
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: GoogleFonts.dmSans(
                                          //     fontSize: 16.sp,
                                          //     fontWeight: FontWeight.w500,
                                          //     color: Color.fromARGB(
                                          //       255,
                                          //       137,
                                          //       26,
                                          //       255,
                                          //     ),
                                          //   ),
                                          // ),
                                          child: locationAsyncValue.when(
                                            data:
                                                (location) => Text(
                                                  location,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.dmSans(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                      255,
                                                      137,
                                                      26,
                                                      255,
                                                    ),
                                                  ),
                                                ),
                                            loading:
                                                () => Center(
                                                  child: SizedBox(
                                                    width: 50.w,
                                                    height: 50.h,
                                                    child:
                                                        const CircularProgressIndicator(),
                                                  ),
                                                ),
                                            error:
                                                (err, stack) => Text(
                                                  "Location unavailable",
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => ShowlikePage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Icon(Icons.favorite_border),
                                      ),
                                    ),
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
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                ),
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
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: ListView.builder(
                                    itemCount: categoryList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          left: 15.w,
                                          right: 15.w,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder:
                                                    (context) =>
                                                        ClothingPage("bicycle"),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 54.w,
                                                height: 54.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                    255,
                                                    246,
                                                    245,
                                                    250,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: ClipOval(
                                                    child:
                                                        categoryList[index]['icon'],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 6.h),
                                              SizedBox(
                                                width: 75.w,
                                                child: Center(
                                                  child: Text(
                                                    categoryList[index]['title'],
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.dmSans(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                        255,
                                                        97,
                                                        91,
                                                        104,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // child: categorProvider.when(
                                  //   data: (category) {
                                  //     return ListView.builder(
                                  //       itemCount: categoryList.length,
                                  //       scrollDirection: Axis.horizontal,
                                  //       itemBuilder: (context, index) {
                                  //         return ;
                                  //       },
                                  //     );
                                  //   },
                                  //   error:
                                  //       (error, stackTrace) =>
                                  //           Center(child: Text(e.toString())),
                                  //   loading:
                                  //       () => Center(
                                  //         child: CircularProgressIndicator(),
                                  //       ),
                                  // ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              SizedBox(
                                height: 180.h,
                                child: CarouselSlider(
                                  scrollPhysics: NeverScrollableScrollPhysics(),
                                  slideTransform: DefaultTransform(),
                                  autoSliderTransitionTime: Duration(
                                    seconds: 1,
                                  ),
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
                              SizedBox(height: 26.h),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.circular(
                                          35.45.r,
                                        ),
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "View all",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                              255,
                                              97,
                                              91,
                                              104,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300.h,
                                child: homepageData.when(
                                  data: (listing) {
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listing.latestListings.length,
                                      itemBuilder: (context, index) {
                                        final product =
                                            listing.latestListings[index];

                                        ///// ye like ke liye
                                        final productId =
                                            listing.latestListings[index].id
                                                .toString();
                                        final isLiked = ref
                                            .watch(likeToggleProvider)
                                            .contains(productId);
                                        var jsondata =
                                            listing
                                                .latestListings[index]
                                                .jsonData
                                                .entries
                                                .toList();
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: 21.h,
                                            left: 20.w,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                          builder:
                                                              (
                                                                context,
                                                              ) => ParticularDealsPage(
                                                                id:
                                                                    listing
                                                                        .latestListings[index]
                                                                        .id
                                                                        .toString(),
                                                              ),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            15.r,
                                                          ),
                                                      child: Image.network(
                                                        // "assets/shoes1.png",
                                                        //dealsList[index]["imageUrl"]
                                                        listing
                                                            .latestListings[index]
                                                            .image
                                                            ?? "https://www.irisoele.com/img/noimage.png",
                                                        width: 240.w,
                                                        height: 160.h,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 15.w,
                                                    top: 15.h,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        final body = LikeBodyModel(
                                                          productId: productId,
                                                          type: "like",
                                                          userId:
                                                              "${box.get("id")}",
                                                        );
                                                        await ref
                                                            .read(
                                                              likeNotiferProvider
                                                                  .notifier,
                                                            )
                                                            .likeProduct(body);

                                                        final toggleNotifier =
                                                            ref.read(
                                                              likeToggleProvider
                                                                  .notifier,
                                                            );

                                                        toggleNotifier.toggle(
                                                          productId,
                                                        );

                                                        final nowLiked =
                                                            toggleNotifier
                                                                .isLiked(
                                                                  productId,
                                                                );

                                                        Fluttertoast.showToast(
                                                          msg:
                                                              nowLiked
                                                                  ? "Added to Liked"
                                                                  : "Removed from Liked",
                                                          toastLength:
                                                              Toast
                                                                  .LENGTH_SHORT,
                                                          gravity:
                                                              ToastGravity
                                                                  .BOTTOM,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 30.w,
                                                        height: 30.h,
                                                        decoration:
                                                            BoxDecoration(
                                                              shape:
                                                                  BoxShape
                                                                      .circle,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                        child: Center(
                                                          child: Icon(
                                                            isLiked
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border,
                                                            color:
                                                                isLiked
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .grey,
                                                            size: 18.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15.h),
                                              Container(
                                                // width: 135.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                  color: Color.fromARGB(
                                                    25,
                                                    137,
                                                    26,
                                                    255,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 6.w,
                                                    right: 6.w,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        size: 15.sp,
                                                        color: Color.fromARGB(
                                                          255,
                                                          137,
                                                          26,
                                                          255,
                                                        ),
                                                      ),
                                                      Text(
                                                        // "Udaipur, rajasthan",
                                                        // dealsList[index]["location"]
                                                        //     .toString(),
                                                        listing.location,
                                                        style:
                                                            GoogleFonts.dmSans(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Color.fromARGB(
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
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                // "Nike Air Jorden 55 Medium",
                                                // dealsList[index]["title"]
                                                //     .toString(),
                                                // listing
                                                //     .latestListings[index]
                                                //     .category,
                                                jsondata[0].value.toString(),
                                                style: GoogleFonts.dmSans(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                    255,
                                                    97,
                                                    91,
                                                    104,
                                                  ),
                                                  letterSpacing: -0.80,
                                                ),
                                              ),
                                              Text(
                                                // "\$450.00",
                                                // dealsList[index]["price"]
                                                //     .toString(),
                                                "₹ ${listing.latestListings[index].price}",
                                                style: GoogleFonts.dmSans(
                                                  fontSize: 18.sp,
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
                                        );
                                      },
                                    );
                                  },
                                  error:
                                      (error, stackTrace) =>
                                          Center(child: Text(e.toString())),
                                  loading:
                                      () => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 20.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "All Products",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 26.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                              255,
                                              36,
                                              33,
                                              38,
                                            ),
                                            letterSpacing: -1,
                                          ),
                                        ),
                                        Container(
                                          width: 65.w,
                                          height: 26.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              35.45.r,
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "View all",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                  255,
                                                  97,
                                                  91,
                                                  104,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(height: 20.h),
                                  // AllProductBody(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AllProductBody(),
                  ],
                ),
              )
              : tabBottom == 1
              ? ChatPage()
              : tabBottom == 2
              ? ListingPage()
              : ProfilePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (token == null) {
            Fluttertoast.showToast(msg: "Please login first");
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => LoginPage()),
            );
          } else {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => ChooseCategoryPage()),
            );
          }
        },
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 137, 26, 255),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        height: 80.h,
        padding: EdgeInsets.zero,
        // color: Colors.yellow,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: _buildTab(
                  icon: Icons.home_outlined,
                  label: "Home",
                  index: 0,
                ),
              ),
              Expanded(
                child: _buildTab(
                  icon: Icons.messenger_outline,
                  label: "Chat",
                  index: 1,
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: _buildTab(
                  icon: Icons.layers_outlined,
                  label: "My Listings",
                  index: 2,
                ),
              ),
              Expanded(
                child: _buildTab(
                  icon: Icons.person_outline,
                  label: "Profile",
                  index: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = tabBottom == index;
    return MaterialButton(
      onPressed: () {
        setState(() {
          tabBottom = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                isSelected
                    ? const Color.fromARGB(255, 137, 26, 255)
                    : const Color.fromARGB(255, 97, 91, 104),
            size: 26.sp,
          ),
          Text(
            label,
            style: GoogleFonts.dmSans(
              color:
                  isSelected
                      ? const Color.fromARGB(255, 137, 26, 255)
                      : const Color.fromARGB(255, 97, 91, 104),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AllProductBody extends ConsumerStatefulWidget {
  const AllProductBody({super.key});

  @override
  ConsumerState<AllProductBody> createState() => _AllProductBodyState();
}

class _AllProductBodyState extends ConsumerState<AllProductBody> {
  List<Map<String, String>> Allproductlist = [
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
    var box = Hive.box("data");
    final homepageData = ref.watch(homepageController);
    return homepageData.when(
      data: (allproduct) {
        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: allproduct.allProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final data = allproduct.allProducts[index];

              ///// ye like ke liye
              final productId = allproduct.allProducts[index].id.toString();
              final isLiked = ref.watch(likeToggleProvider).contains(productId);
              var jsondata =
                  allproduct.allProducts[index].jsonData.entries.toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder:
                                  (context) => ParticularDealsPage(
                                    id:
                                        allproduct.allProducts[index].id
                                            .toString(),
                                  ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.network(
                            // "assets/shoes1.png",
                            // latestList[index]["imageUrl"].toString(),
                            allproduct.allProducts[index].image?? "https://www.irisoele.com/img/noimage.png",
                            width: 196.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15.w,
                        top: 15.h,
                        child: GestureDetector(
                          onTap: () async {
                            final body = LikeBodyModel(
                              productId: productId,
                              type: "like",
                              userId: "${box.get('id')}",
                            );
                            await ref
                                .read(likeNotiferProvider.notifier)
                                .likeProduct(body);

                            final toggleNotifier = ref.read(
                              likeToggleProvider.notifier,
                            );
                            toggleNotifier.toggle(productId);
                            final nowLiked = toggleNotifier.isLiked(productId);
                            Fluttertoast.showToast(
                              msg:
                                  nowLiked
                                      ? "Added to Liked"
                                      : "Removed from Liked",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Center(
                                child: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.grey,
                                  size: 18.sp,
                                ),
                              ),
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
                            // "Udaipur, rajasthan",
                            allproduct.location,
                            // allproduct.allProducts[index].address.toString(),
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
                    // latestList[index]["title"].toString(),
                    // allproduct.allProducts[index].name,
                    jsondata[0].value,
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 97, 91, 104),
                      letterSpacing: -0.80,
                    ),
                  ),
                  Text(
                    // "\$450.00",
                    // latestList[index]["price"].toString(),
                    "₹ ${allproduct.allProducts[index].price.toString()}",
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
    );
  }
}
