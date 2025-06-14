import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/cagetory/car.form.page.dart';
import 'package:shopping_app_olx/cagetory/new.plan.page.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/new/new.service.dart';

class LandAndPlotFormPage extends StatefulWidget {
  const LandAndPlotFormPage({super.key});

  @override
  State<LandAndPlotFormPage> createState() => _LandAndPlotFormPageState();
}

class _LandAndPlotFormPageState extends State<LandAndPlotFormPage> {
  final plotAreaContorlelr = TextEditingController();
  final breathControlelr = TextEditingController();
  final lenghtControler = TextEditingController();
  final furshingController = TextEditingController();
  final projectControler = TextEditingController();
  final listedControlelr = TextEditingController();
  final superbuildController = TextEditingController();
  final carpetControlelr = TextEditingController();
  final mentationController = TextEditingController();
  final florControlelr = TextEditingController();
  final florNumberControler = TextEditingController();
  final carparkingContrller = TextEditingController();
  final facingcontroler = TextEditingController();
  final proejctnameControler = TextEditingController();
  final titleControler = TextEditingController();
  final desContrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "type": plotAreaContorlelr.text,
      "bhk": breathControlelr.text,
      "bath": lenghtControler.text,
      "furs": furshingController.text,
      "project": projectControler.text,
      "listed": listedControlelr.text,
      "superbuild": superbuildController.text,
      "carpet": carpetControlelr.text,
      "mentation": mentationController.text,
      "flor": florControlelr.text,
      "florNumber": florNumberControler.text,
      "carparking": carparkingContrller.text,
      "facing": facingcontroler.text,
      "projectname": proejctnameControler.text,
      "title": titleControler.text,
      "des": desContrler.text,
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                    "Include some details",
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
                      Text(
                        "Type *",
                        style: GoogleFonts.dmSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(153, 0, 0, 0),
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 190.w,
                            height: 53.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: Color.fromARGB(153, 0, 0, 0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "For Rent",
                                style: GoogleFonts.dmSans(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(153, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 190.w,
                            height: 53.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: Color.fromARGB(153, 0, 0, 0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "For Sale",
                                style: GoogleFonts.dmSans(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(153, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Listed by*",
                        controller: listedControlelr,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Plot Area*",
                        controller: plotAreaContorlelr,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Length", controller: lenghtControler),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Breadth",
                        controller: breathControlelr,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(labeltxt: "Facing", controller: facingcontroler),
                      SizedBox(height: 10.h),
                      FormBody(
                        labeltxt: "Project Name",
                        controller: proejctnameControler,
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        controller: titleControler,
                        labeltxt: "Ad title*",
                        helper:
                            "Mention the key features of your item (eg. brand, model 0/70 age, type)",
                      ),
                      SizedBox(height: 10.h),
                      FormBody(
                        controller: desContrler,
                        labeltxt: "Describe what you are selling *",
                        helper:
                            "Include condition, features and reason for selling\nRequired Fields",
                        maxlenghts: 4096,
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            49.h,
                          ),
                          backgroundColor: Color.fromARGB(255, 137, 26, 255),
                        ),
                        onPressed: () async {
                          final service = APIService(await createDio());
                          await service.addProduct(data);
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
      ),
    );
  }
}
