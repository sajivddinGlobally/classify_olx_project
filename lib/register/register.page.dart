import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 3 / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
                ),
              ),
            ),
            Image.asset("assets/bgimage.png"),
            Positioned.fill(
              top: 168.h,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Welcome to App name",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 26.sp,
                        color: Color(0xFF242126),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 44.w, right: 44.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Register yourself to our platform to get best product and sell your products for extra earnings",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xFF615B68),
                        letterSpacing: -0.75,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterBody(
                          title: "Full Name",
                          controller: nameController,
                          type: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        RegisterBody(
                          title: "Email",
                          controller: emailController,
                          type: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style: GoogleFonts.dmSans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF615B68),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              decoration: InputDecoration(
                                counterText: '',
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.45.r),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.45.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        RegisterBody(
                          title: "Street Address",
                          controller: addController,
                          type: TextInputType.streetAddress,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: RegisterBody(
                                title: "City",
                                controller: cityController,
                                type: TextInputType.text,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pincode",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF615B68),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextFormField(
                                    maxLength: 6,
                                    keyboardType: TextInputType.number,
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      filled: true,
                                      fillColor: Color(0xFFFFFFFF),
                                      enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          35.45.r,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          35.45.r,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              49.h,
                            ),
                            backgroundColor: Color.fromARGB(255, 137, 26, 255),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Resiger",
                            style: GoogleFonts.dmSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 75.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.dmSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF615B68),
                              ),
                            ),
                            Text(
                              "Login",
                              style: GoogleFonts.dmSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF891AFF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterBody extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType type;
  const RegisterBody({
    super.key,
    required this.title,
    required this.controller,
    required this.type,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.dmSans(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF615B68),
          ),
        ),
        SizedBox(height: 12.h),
        TextFormField(
          keyboardType: widget.type,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(35.45.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(35.45.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
