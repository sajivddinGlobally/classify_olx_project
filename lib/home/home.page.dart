import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app_olx/cagetory/category.page.dart';
import 'package:shopping_app_olx/chat/chat.page.dart';
import 'package:shopping_app_olx/cloth/clothing.page.dart';
import 'package:shopping_app_olx/home/service/getAllProductController.dart';
import 'package:shopping_app_olx/listing/listing.page.dart';
import 'package:shopping_app_olx/map/map.page.dart';
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

  int tabBottom = 0;

  @override
  Widget build(BuildContext context) {
    final homeAllProduct = ref.watch(getAllProductControler);
    var box = Hive.box("data");
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
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder:
                                                      (context) =>
                                                          ClothingPage(),
                                                ),
                                              );
                                            },
                                            child: SelectBody(
                                              image: "assets/clothing.png",
                                              text: "Clothing ",
                                            ),
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
                                child: homeAllProduct.when(
                                  data: (product) {
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: product.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder:
                                                    (context) =>
                                                        ParticularDealsPage(
                                                          id:
                                                              product
                                                                  .data[index]
                                                                  .id
                                                                  .toString(),
                                                        ),
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
                                                            Icons
                                                                .favorite_border,
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
                                                          dealsList[index]["location"]
                                                              .toString(),
                                                          style: GoogleFonts.dmSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                  product.data[index].name,

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
                                                  product.data[index].price
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
                                    );
                                  },
                                  error:
                                      (error, stackTrace) =>
                                          Center(child: Text(error.toString())),
                                  loading:
                                      () => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                ),
                              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => CategoryPage()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 137, 26, 255),
        child: Icon(Icons.add, size: 32.sp, color: Colors.white),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        height: 80.h,
        padding: EdgeInsets.zero,
        // color: Colors.yellow,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          children: [
            _buildTab(icon: Icons.home_outlined, label: "Home", index: 0),
            _buildTab(icon: Icons.messenger_outline, label: "Chat", index: 1),
            SizedBox(width: 8.w),
            _buildTab(
              icon: Icons.layers_outlined,
              label: "My Listings",
              index: 2,
            ),
            _buildTab(icon: Icons.person_outline, label: "Profile", index: 3),
          ],
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
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 0.h,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      "assets/shoes1.png",

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
                        child: Icon(Icons.favorite_border, size: 18.sp),
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
          );
        },
      ),
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
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: latestList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 0.h,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      // "assets/shoes1.png",
                      latestList[index]["imageUrl"].toString(),
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
                        child: Icon(Icons.favorite_border, size: 18.sp),
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
                        latestList[index]["location"].toString(),
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
                latestList[index]["title"].toString(),
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 97, 91, 104),
                  letterSpacing: -0.80,
                ),
              ),
              Text(
                // "\$450.00",
                latestList[index]["price"].toString(),
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
