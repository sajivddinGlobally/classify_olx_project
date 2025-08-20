



import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app_olx/home/service/homepageController.dart';
import 'package:shopping_app_olx/like/model/likeBodyModel.dart';
import 'package:shopping_app_olx/like/service/likeController.dart';
import 'package:shopping_app_olx/map/service/locationController.dart';
import 'package:shopping_app_olx/particularDeals/particularDeals.page.dart';

class ViewAllPage extends ConsumerStatefulWidget {
  bool data;
  final int? page;
   ViewAllPage(this.data,{super.key, this.page});
  @override
  ConsumerState<ViewAllPage> createState() => _ViewAllPageState();
}


class _ViewAllPageState extends ConsumerState<ViewAllPage> {

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
    {"icon": Icon(Icons.car_rental, color: Colors.blue.shade400), "title": "Cars", "subTitle": "Car"},
    {"icon": Icon(Icons.house_outlined, color: Colors.blue.shade400), "title": "Properties", "subTitle": "Property"},
    {"icon": Icon(Icons.mobile_friendly, color: Colors.blue.shade400), "title": "Mobiles", "subTitle": "Mobile"},
    {"icon": Icon(Icons.badge_outlined, color: Colors.blue.shade400), "title": "Jobs", "subTitle": "Job"},
    {"icon": Icon(Icons.bike_scooter_outlined, color: Colors.blue.shade400), "title": "Bikes", "subTitle": "Bike"},
    {"icon": Icon(Icons.tv_outlined, color: Colors.blue.shade400), "title": "Electronics", "subTitle": "Electronic"},
    {"icon": Icon(Icons.transform_outlined, color: Colors.blue.shade400), "title": "Commercials", "subTitle": "Commercial"},
  ];



  int tabBottom = 0;
  DateTime? lastBackPressTime;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';




  @override
  void initState() {
    super.initState();
    tabBottom = widget.page ?? 0;
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }



  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var token = box.get("token");
    final homepageData = ref.watch(homepageController);
    final locationAsyncValue = ref.watch(locationProvider);
    if (homepageData.error != null) {
      print("Error in homepageData: ${homepageData.error}");
      return Scaffold(body: Center(child: Text("${homepageData.error}")));
    }
    return

    Scaffold(
        body:



        RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(homepageController);
            ref.invalidate(allCategoryController);
            await ref.read(homepageController.future);
          },
          child: SingleChildScrollView(
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
                    Container(
                      margin: EdgeInsets.all(20.sp),
                      child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                        Text(
                          "My Product",
                          style: GoogleFonts.dmSans(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        SizedBox()

                      ],
                    ),),



                    Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),

                          SizedBox(height: 24.h),

                          widget.data==true?
                        homepageData.when(
                              data: (listing) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  key: ValueKey(listing), // Ensure ListView rebuilds on data change
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listing.latestListings?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final product = listing.latestListings![index];
                                    final productId = product.id.toString();
                                    Map<String, dynamic> jsonData = {};
                                    try {
                                      if (product.jsonData != null) {
                                        jsonData = jsonDecode(product.jsonData!) as Map<String, dynamic>;
                                      }
                                    } catch (e) {
                                      print("Error parsing jsonData: $e");
                                    }
                                    final title = jsonData['title']?.toString() ?? 'No Title Available';
                                    return Padding(
                                      padding: EdgeInsets.only(top: 21.h, left: 20.w,right: 20.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [

                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (context) => ParticularDealsPage(
                                                        id: productId,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(15.r),
                                                  child: Image.network(
                                                    product.image ?? "https://www.irisoele.com/img/noimage.png",
                                                    width: double.infinity,
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
                                                    bool isLikes = product.userlike ?? false;
                                                    final body = LikeBodyModel(
                                                      productId: productId,
                                                      type: "like",
                                                      userId: "${box.get("id")}",
                                                    );
                                                    await ref.read(likeNotiferProvider.notifier).likeProduct(body);
                                                    ref.invalidate(homepageController);
                                                    ref.invalidate(allCategoryController);
                                                    await Future.delayed(Duration.zero);
                                                    Fluttertoast.showToast(
                                                      msg: isLikes ? "Removed from Liked" : "Added to Liked",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 30.w,
                                                    height: 30.h,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        product.userlike ?? false
                                                            ? Icons.favorite
                                                            : Icons.favorite_border,
                                                        color: product.userlike ?? false
                                                            ? Colors.red
                                                            : Colors.grey,
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
                                            width: 80.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30.r),
                                              color: Color.fromARGB(25, 137, 26, 255),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 6.w, right: 6.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 15.sp,
                                                    color: Color.fromARGB(255, 137, 26, 255),
                                                  ),

                                                  if(  product.listingType=="Free")
                                                    Text(
                                                      listing.location ?? 'Unknown Location',
                                                      style: GoogleFonts.dmSans(
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(255, 137, 26, 255),
                                                      ),
                                                    ),

                                                  if( product.listingType=="city")
                                                    Text(
                                                      "City" ?? 'Unknown Location',
                                                      style: GoogleFonts.dmSans(
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(255, 137, 26, 255),
                                                      ),
                                                    ),

                                                  if( product.listingType=="state")
                                                    Text(
                                                      "State" ?? 'Unknown Location',
                                                      style: GoogleFonts.dmSans(
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(255, 137, 26, 255),
                                                      ),
                                                    ),


                                                  if( product.listingType=="country")
                                                    Text(
                                                      "Country" ?? 'Unknown Location',
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
                                            title,
                                            style: GoogleFonts.dmSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(255, 97, 91, 104),
                                              letterSpacing: -0.80,
                                            ),
                                          ),
                                          Text(
                                            "₹ ${product.price ?? 'N/A'}",
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
                                );
                              },
                              error: (error, stackTrace) => Center(child: Text(error.toString())),
                              loading: () => Center(child: CircularProgressIndicator()),

                          ):Text(""),

                          SizedBox(height: 20.h),
                          widget.data==false?
                          AllProductBody(searchQuery: _searchQuery, key: ValueKey(_searchQuery)):Text("")

                        ],
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        )






    );
  }








}

class AllProductBody extends ConsumerStatefulWidget {
  final String searchQuery;
  const AllProductBody({super.key, required this.searchQuery});

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
        final filteredProducts = allproduct.allProducts?.where((product) {
          Map<String, dynamic> jsonData = {};
          try {
            if (product.jsonData != null) {
              jsonData = jsonDecode(product.jsonData!) as Map<String, dynamic>;
            }
          } catch (e) {
            print("Error parsing jsonData: $e");
          }
          final title = jsonData['title']?.toString().toLowerCase() ?? "";
          final location = allproduct.location?.toLowerCase() ?? "";
          final price = product.price?.toString().toLowerCase() ?? "";
          final query = widget.searchQuery.toLowerCase();
          return title.contains(query) || location.contains(query) || price.contains(query);
        }).toList() ?? [];

        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child:
          filteredProducts.isEmpty
              ? Center(
            child: Text(
              "No products found",
              style: GoogleFonts.dmSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 97, 91, 104),
              ),
            ),
          )
              : ListView.builder(
            scrollDirection: Axis.vertical,
            key: ValueKey(allproduct), // Ensure GridView rebuilds on data change
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: filteredProducts.length,

            itemBuilder: (context, index) {
              final data = filteredProducts[index];
              final productId = data.id.toString();
              Map<String, dynamic> jsonData = {};
              try {
                if (data.jsonData != null) {
                  jsonData = jsonDecode(data.jsonData!) as Map<String, dynamic>;
                }
              } catch (e) {
                print("Error parsing jsonData: $e");
              }
              final title = jsonData['title']?.toString() ?? 'No Title Available';
              final listingType = data.listingType ?? 'No listingType Available';

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
                              builder: (context) => ParticularDealsPage(id: productId),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.network(
                            data.image ?? "https://www.irisoele.com/img/noimage.png",
                            width:double.infinity,
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
                            bool isLikes = data.userlike ?? false;
                            final body = LikeBodyModel(
                              productId: productId,
                              type: "like",
                              userId: "${box.get("id")}",
                            );
                            await ref.read(likeNotiferProvider.notifier).likeProduct(body);
                            ref.invalidate(homepageController);
                            ref.invalidate(allCategoryController);
                            await Future.delayed(Duration.zero);
                            Fluttertoast.showToast(
                              msg: isLikes ? "Removed from Liked" : "Added to Liked",
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
                              child: Icon(
                                data.userlike ?? false ? Icons.favorite : Icons.favorite_border,
                                color: data.userlike ?? false ? Colors.red : Colors.grey,
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
                          /*  Icon(
                            Icons.location_on,
                            size: 15.sp,
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),
                          Text(
                            allproduct.location ?? 'Unknown Location',
                            style: GoogleFonts.dmSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 137, 26, 255),
                            ),
                          ),*/



                          Icon(
                            Icons.location_on,
                            size: 15.sp,
                            color: Color.fromARGB(255, 137, 26, 255),
                          ),


                          if(listingType=="Free")

                            Text(
                              "Free" ?? 'Unknown Location',
                              style: GoogleFonts.dmSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 137, 26, 255),
                              ),
                            ),

                          if( listingType=="city")
                            Text(
                              "City" ?? 'Unknown Location',
                              style: GoogleFonts.dmSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 137, 26, 255),
                              ),
                            ),

                          if(listingType=="state")
                            Text(
                              "State" ?? 'Unknown Location',
                              style: GoogleFonts.dmSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 137, 26, 255),
                              ),
                            ),


                          if(listingType=="country")
                            Text(
                              "Country" ?? 'Unknown Location',
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
                    title,
                    style: GoogleFonts.dmSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 97, 91, 104),
                    ),
                  ),
                  Text(
                    "₹ ${data.price ?? 'N/A'}",
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
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}


