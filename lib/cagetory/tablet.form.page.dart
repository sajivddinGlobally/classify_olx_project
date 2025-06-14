import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/cagetory/car.form.page.dart';
import 'package:shopping_app_olx/cagetory/new.plan.page.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/new/new.service.dart';

class TabletFormPage extends StatefulWidget {
  const TabletFormPage({super.key});

  @override
  State<TabletFormPage> createState() => _TabletFormPageState();
}

class _TabletFormPageState extends State<TabletFormPage> {
  final typeControler = TextEditingController();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "owner": typeControler.text,
      "title": titleController.text,
      "desc": descController.text,
    };
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
          Column(
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
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "Mobile",
                  style: GoogleFonts.dmSans(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    FormBody(labeltxt: "Type *", controller: typeControler),
                    SizedBox(height: 15.h),
                    FormBody(
                      controller: titleController,
                      labeltxt: "Ad title*",
                      helper:
                          "Mention the key features of your item (eg. brand, model 0/70 age, type)",
                    ),
                    SizedBox(height: 15.h),
                    FormBody(
                      controller: descController,
                      labeltxt: "Describe what you are selling *",
                      helper:
                          "Include condition, features and reason for selling\nRequired Fields",
                      maxlenghts: 4096,
                    ),
                    SizedBox(height: 40.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          49.h,
                        ),
                        backgroundColor: Color.fromARGB(255, 137, 26, 255),
                      ),
                      onPressed: () async {
                        final apiserce = APIService(await createDio());
                        await apiserce.addProduct(data);

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => NewPlanPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: GoogleFonts.dmSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
