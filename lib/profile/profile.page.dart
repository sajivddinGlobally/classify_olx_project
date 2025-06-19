import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app_olx/edit/editProfile.dart';
import 'package:shopping_app_olx/home/home.page.dart';
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
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var token = box.get("token");
    final profileData = ref.watch(
      profileController("${box.get("id").toString()}"),
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
              ),
            ),
          ),
          Image.asset("assets/bgimage.png"),
          // Padding(
          //   padding: EdgeInsets.only(left: 20.w, top: 60.h),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       width: 46.w,
          //       height: 46.h,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.white,
          //       ),
          //       child: Icon(Icons.arrow_back),
          //     ),
          //   ),
          // ),
          profileData.when(
            data: (data) {
              return Positioned(
                top: 120.h,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 126.w,
                      height: 126.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                      child: Center(
                        child: ClipOval(
                          child: Image.network(
                            data.data.image ??
                                "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                            width: 126.w,
                            height: 126.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      // box.get("fullName") ?? "sajivddin",
                      data.data.fullName,
                      style: GoogleFonts.dmSans(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 33, 36, 38),
                      ),
                    ),
                    Text(
                      // "jacksonrobert@gmail.com",
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
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 350.h,
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          //top: 25.h,
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
                            EditProfileBody(
                              icon: Icons.help_outline,
                              name: 'Help & Support',
                            ),
                            // SizedBox(height: 10.h),
                            // EditProfileBody(
                            //   icon: Icons.insert_drive_file_outlined,
                            //   name: 'Terms & Condition',
                            // ),
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
                                      msg: "Logout successfull",
                                    );
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => HomePage(),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
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
