import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app_olx/edit/editProfile.dart';
import 'package:shopping_app_olx/listing/service/getlistingController.dart';
import 'package:shopping_app_olx/login/login.page.dart';
import 'package:shopping_app_olx/model/active.plan.dart';
import 'package:shopping_app_olx/new/controller/plan.provider.dart';
import 'package:shopping_app_olx/plan/plan.page.dart';
import 'package:shopping_app_olx/profile/service/profileController.dart';
import 'package:shopping_app_olx/splash.page.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => ref.invalidate(activePlanProvider));
  }


  bool _hasRefreshed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasRefreshed) {
      Future.microtask(() {
        final box = Hive.box("data");
        ref.invalidate(activePlanProvider);
        ref.invalidate(profileController("${box.get("id").toString()}"));
      });
      _hasRefreshed = true;
    }
  }
  // Refresh handler for pull-to-refresh
  Future<void> _onRefresh() async {
    final box = Hive.box("data");
    ref.invalidate(activePlanProvider);
    ref.invalidate(profileController("${box.get("id").toString()}"));
    // Optional delay to show the refresh indicator
    await Future.delayed(Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var token = box.get("token");
    final profileData = ref.watch(
      profileController("${box.get("id").toString()}"),
    );
    final activePlan = ref.watch(activePlanProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
          ),
        ),
        child:RefreshIndicator(
    onRefresh: _onRefresh, // Pull-to-refresh handler
    child: SingleChildScrollView(
    // Ensure the content is scrollable for RefreshIndicator
    physics: AlwaysScrollableScrollPhysics(),
    child:Column(
            children: [

              Stack(children: [
                Image.asset("assets/bgimage.png"),
                profileData.when(
                  data: (data) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [



                          Container(
                            width: 126.w,
                            height: 126.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: ClipOval(
                                child:
                                data.data.profile_approved == "Pending" || data.data.image == null?
                                Icon(Icons.person,size: 60.sp,):
                                Image.network(
                                  // data.data.profile_approved == "Pending" || data.data.image == null
                                  //     ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
                                  //     :
                                data.data.image,
                                  width: 126.w,
                                  height: 126.h,
                                  fit: BoxFit.cover,
                                )
                                      // :

                              ),
                            ),
                          ),


                          SizedBox(height: 20.h),
                          Text(
                            data.data.fullName,
                            style: GoogleFonts.dmSans(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 33, 36, 38),
                            ),
                          ),
                          Text(
                            "+91 ${data.data.phoneNumber}",
                            style: GoogleFonts.dmSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 97, 91, 104),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Container(
                            width: 120.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: Color.fromARGB(25, 137, 26, 255),
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => EditProfile(),
                                  ),
                                );
                                if (result == true) {
                                  var box = Hive.box("data");
                                  ref.invalidate(
                                    profileController("${box.get("id").toString()}"),
                                  );
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 137, 26, 255),
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Edit Profile",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 137, 26, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          activePlan.when(
                            data: (snap) {
                              final box = Hive.box("data");
                              if (snap != null) {
                                box.put("plan_id", snap!.activePlan.planId);
                                box.put('maxpost', snap.activePlan.plan);
                              }
                              return snap == null
                                  ? SizedBox()
                                  : buildActivePlanCard(snap);
                            },
                            error: (err, stack) => Center(child: SizedBox()),
                            loading: () => Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(height: 40.h),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                bottom: 30.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 30.h),
                                  GestureDetector(
                                    onTap: () async {
                                      final result = await Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => EditProfile(),
                                        ),
                                      );
                                      if (result == true) {
                                        var box = Hive.box("data");
                                        ref.invalidate(
                                          profileController(
                                            "${box.get("id").toString()}",
                                          ),
                                        );
                                      }
                                    },
                                    child: EditProfileBody(
                                      icon: Icons.person_outlined,
                                      name: 'Edit Profile',
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => PlanPage(),
                                        ),
                                      );
                                    },
                                    child: EditProfileBody(
                                      icon: Icons.menu,
                                      name: 'Paid Plan',
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () {},
                                    child: EditProfileBody(
                                      icon: Icons.help_outline,
                                      name: 'Help & Support',
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  if (token != null) ...[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 25.w,
                                        right: 25.w,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          box.clear();
                                          Fluttertoast.showToast(
                                            msg: "Logout successful",
                                          );
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              color: Color.fromARGB(255, 97, 91, 104),
                                              size: 26.sp,
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              "Logout",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                  255,
                                                  97,
                                                  91,
                                                  104,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color.fromARGB(255, 97, 91, 104),
                                              size: 20.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ] else ...[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 25.w,
                                        right: 25.w,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) => SplashPage(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              color: Color.fromARGB(255, 97, 91, 104),
                                              size: 26.sp,
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              "Login",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                  255,
                                                  97,
                                                  91,
                                                  104,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color.fromARGB(255, 97, 91, 104),
                                              size: 20.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50.h), // Extra padding to ensure scrolling
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    if (error is UserNotLoggedInException) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacementNamed('/login');
                      });
                    }
                    return Center(child: Text(error.toString()));
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                ),


              ],)

            ],
          ),
        ),
      ),
      ) );
  }

  Widget buildActivePlanCard(ActivePlan activePlan) {
    final plan = activePlan.activePlan;
    final price = double.tryParse(plan.plan.price);
    if (price == null || price <= 0) {
      return SizedBox.shrink(); // Hide card if invalid or free
    }    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 4,
      color: Colors.white,
      margin: EdgeInsets.all(16.w),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan.plan.description,
              style: GoogleFonts.dmSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10.h),
            _planRow("Price", "₹${plan.plan.price}"),
            _planRow("Duration", "${plan.plan.duration} days"),
            _planRow(
              "Boosts",
              "${plan.plan.boostCount} (Used: ${plan.usedBoost})",
            ),
            _planRow(
              "Valid From",
              DateFormat("dd MMM yyyy").format(plan.createdAt),
            ),
            _planRow(
              "Valid Till",
              DateFormat("dd MMM yyyy").format(plan.endDate),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                downloadInvoice(context);
              },
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Center(
                  child: Text(
                    "Download Invoice",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _planRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Generate random GST Number-like string

  String generateRandomGST() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final rand = Random();
    return List.generate(15, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  Future<void> downloadInvoice(BuildContext context) async {
    // Show full screen loader
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      var box = await Hive.openBox("data");
      String userId = box.get("id") ?? "0";
      String gstNumber = generateRandomGST(); // 🔹 Unique GST number

      final url =
          'https://classified.globallywebsolutions.com/api/generateInvoice?user_id=$userId&gst_number=$gstNumber';

      final dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/invoice_user_${userId}_$gstNumber.pdf';

      final response = await dio.download(
        url,
        filePath,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) => status! < 500,
        ),
      );

      Navigator.pop(context); // Hide loader

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invoice downloaded successfully!')),
        );
        await OpenFile.open(filePath);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download invoice.')),
        );
      }
    } catch (e) {
      Navigator.pop(context); // Hide loader on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

}

class EditProfileBody extends StatelessWidget {
  final IconData icon;
  final String name;

  const EditProfileBody({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Color.fromARGB(255, 97, 91, 104), size: 26.sp),
              SizedBox(width: 8.w),
              Text(
                name,
                style: GoogleFonts.dmSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 97, 91, 104),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 97, 91, 104),
                size: 20.sp,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(),
        ],
      ),
    );
  }
}
