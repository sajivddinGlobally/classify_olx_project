import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/cagetory/category.page.dart';
import 'package:shopping_app_olx/chat/chat.page.dart';
import 'package:shopping_app_olx/listing/listing.page.dart';
import 'package:shopping_app_olx/particularDeals/particularDeals.page.dart';
import 'package:shopping_app_olx/profile/profile.page.dart';

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

  int tabBottom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 228, 250),
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
                                      Text(
                                        "Jaipur, rajasthan",
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
                                    child: Center(
                                      child: Icon(Icons.favorite_border),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: dealsList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder:
                                                (context) =>
                                                    ParticularDealsPage(),
                                          ),
                                        );
                                      },
                                      child: Padding(
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
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        15.r,
                                                      ),
                                                  child: Image.asset(
                                                    // "assets/shoes1.png",
                                                    dealsList[index]["imageUrl"]
                                                        .toString(),
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
                                              // width: 135.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
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
                                                      dealsList[index]["location"]
                                                          .toString(),
                                                      style: GoogleFonts.dmSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                            ),
                                            SizedBox(height: 8.h),
                                            Text(
                                              // "Nike Air Jorden 55 Medium",
                                              dealsList[index]["title"]
                                                  .toString(),
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
                                              dealsList[index]["price"]
                                                  .toString(),
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
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SelectBody(
                                          image: "assets/Starbucks.png",
                                          text: "Starbucks",
                                        ),
                                        SelectBody(
                                          image: "assets/Honda.png",
                                          text: "Honda",
                                        ),
                                        SelectBody(
                                          image: "assets/Adidas.png",
                                          text: "Adidas",
                                        ),
                                        SelectBody(
                                          image: "assets/MacDonalds.png",
                                          text: "MacDonalds",
                                        ),
                                        SelectBody(
                                          image: "assets/Redbull.png",
                                          text: "Redbull",
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SelectBody(
                                          image: "assets/Aston martin.png",
                                          text: "Aston martin",
                                        ),
                                        SelectBody(
                                          image: "assets/Peugeot.png",
                                          text: "Peugeot",
                                        ),
                                        SelectBody(
                                          image: "assets/Lacerte.png",
                                          text: "Lacerte",
                                        ),
                                        SelectBody(
                                          image: "assets/Gucci.png",
                                          text: "Gucci",
                                        ),
                                        SelectBody(
                                          image: "assets/Marshall.png",
                                          text: "Marshall",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.h),
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
                                      "Latest Listing",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 36, 33, 38),
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
                              SizedBox(height: 20.h),
                              LatestBody(),
                              SizedBox(height: 30.h),
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
                                      "Trending Products",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 36, 33, 38),
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
                              SizedBox(height: 20.h),
                              ProductBody(),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : tabBottom == 1
              ? ChatPage()
              : tabBottom == 2
              ? ListingPage()
              : ProfilePage(),
      bottomNavigationBar: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  tabBottom = value;
                });
              },
              currentIndex: tabBottom,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color.fromARGB(255, 137, 26, 255),
              unselectedItemColor: Color.fromARGB(255, 97, 91, 104),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.messenger_outline),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.layers_outlined),
                  label: "My Listings",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => CategoryPage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50.h),
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 137, 26, 255),
                    ),
                    child: Center(child: Icon(Icons.add, color: Colors.white)),
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

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  List<Map<String, String>> productList = [
    {
      "imageUrl": "assets/car1.png",
      "location": "Udaipur, rajasthan",
      "title": "Raymond's Silk Shirts with red coller",
      "price": "\$250.00",
    },
    {
      "imageUrl": "assets/car2.png",
      "location": "Tesla Models ",
      "title": "Electric Sedan with Autopilot",
      "price": "\$94,990.00",
    },
    {
      "imageUrl": "assets/car3.png",
      "location": "Udaipur, rajasthan",
      "title": "Raymond's Silk Shirts with red coller",
      "price": "\$250.00",
    },
    {
      "imageUrl": "assets/car1.png",
      "location": "Ford Mustang",
      "title": "Classic Muscle Car with V8 Engine",
      "price": "\$43,000.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 108.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      // "assets/car1.png",
                      productList[index]["imageUrl"].toString(),
                      width: 120.w,
                      height: 84.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            // width: 135.w,
                            height: 20.h,
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
                                    productList[index]["location"].toString(),
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
                        ],
                      ),
                      Text(
                        // "Raymond's Silk Shirts with red coller",
                        productList[index]["title"].toString(),
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 97, 91, 104),
                          letterSpacing: -0.80,
                        ),
                      ),
                      Text(
                        // "\$250.00",
                        productList[index]["price"].toString(),
                        style: GoogleFonts.dmSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 137, 26, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14.w),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LatestBody extends StatefulWidget {
  const LatestBody({super.key});

  @override
  State<LatestBody> createState() => _LatestBodyState();
}

class _LatestBodyState extends State<LatestBody> {
  List<Map<String, String>> latestList = [
    {"imageUrl": "assets/shirt1.png"},
    {"imageUrl": "assets/shirt2.png"},
    {"imageUrl": "assets/shirt3.png"},
    {"imageUrl": "assets/shirt4.png"},
    {"imageUrl": "assets/shirt5.png"},
    {"imageUrl": "assets/shirt6.png"},
    {"imageUrl": "assets/shirt7.png"},
    {"imageUrl": "assets/shirt8.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: latestList.length,
        itemCount: (latestList.length / 2).ceil(),
        itemBuilder: (context, index) {
          int topIndex = index * 2;
          int bottomIndex = topIndex + 1;
          return Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.w,
                          top: 6.h,
                          bottom: 6.h,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            // "assets/shirt1.png",
                            // latestList[index]["imageUrl"].toString(),
                            latestList[topIndex]["imageUrl"]!,
                            width: 70.w,
                            height: 78.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: 135.w,
                            height: 20.h,
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
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6.w,
                              top: 6.h,
                              bottom: 6.h,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                // "assets/shirt1.png",
                                // latestList[index]["imageUrl"].toString(),
                                latestList[bottomIndex]["imageUrl"]!,
                                width: 70.w,
                                height: 78.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // width: 135.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: Color.fromARGB(25, 137, 26, 255),
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
                                        "Udaipur, rajasthan",
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
                              ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
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
        SizedBox(height: 6.h),
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
