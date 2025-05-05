import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/config/pretty.dio.dart';
import 'package:shopping_app_olx/product/model.addproduct/addProductBodyModel.dart';
import 'package:shopping_app_olx/product/service.addproduct/addproductService.dart';
import 'package:shopping_app_olx/product/upload.page.dart';
import 'package:shopping_app_olx/register/register.page.dart';

class ProductRegisterPage extends StatefulWidget {
  const ProductRegisterPage({super.key});

  @override
  State<ProductRegisterPage> createState() => _ProductRegisterPageState();
}

class _ProductRegisterPageState extends State<ProductRegisterPage> {
  final categoryController = TextEditingController();
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final numberController = TextEditingController();
  final pincodeController = TextEditingController();
  final productDesController = TextEditingController();

  bool isAddProduct = false;

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
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 60.h),
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
            Positioned(
              top: 168.h,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Enter Product Details",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 26.sp,
                        color: Color(0xFF242126),
                        letterSpacing: -0.65,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 44.w, right: 44.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Join our platform today to showcase your items and boost your earnings!",
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
                          title: "Product Category",
                          controller: categoryController,
                          type: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        RegisterBody(
                          title: "Product Name",
                          controller: productNameController,
                          type: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        RegisterBody(
                          title: "Price",
                          controller: priceController,
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact at",
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
                              controller: numberController,
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
                        Column(
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
                              keyboardType: TextInputType.phone,
                              controller: pincodeController,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Description ",
                              style: GoogleFonts.dmSans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF615B68),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            TextFormField(
                              maxLines: 6,
                              keyboardType: TextInputType.text,
                              controller: productDesController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  top: 20.h,
                                  left: 20.w,
                                ),
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
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.r),
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                isAddProduct = true;
                              });
                              try {
                                final body = AddproductBodyModel(
                                  category: categoryController.text,
                                  name: productNameController.text,
                                  price: priceController.text,
                                  contact: numberController.text,
                                  pincode: pincodeController.text,
                                  description: productDesController.text,
                                );
                                final addproductservice = AddproductService(
                                  await createDio(),
                                );
                                final response = await addproductservice
                                    .addProduct(body);
                                Fluttertoast.showToast(
                                  msg: "Product add successful",
                                );
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder:
                                        (context) => UploadPage(
                                          productId:
                                              response.product.id.toString(),
                                        ),
                                  ),
                                );
                              } catch (e) {
                                setState(() {
                                  isAddProduct = false;
                                });
                                log(e.toString());

                                Fluttertoast.showToast(msg: "Failed");
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 49.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.45.r),
                                border: Border.all(
                                  color: Color.fromARGB(255, 137, 26, 255),
                                  width: 1.w,
                                ),
                              ),
                              child: Center(
                                child:
                                    isAddProduct == false
                                        ? Text(
                                          "Next",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                              255,
                                              137,
                                              26,
                                              255,
                                            ),
                                          ),
                                        )
                                        : CircularProgressIndicator(
                                          color: Color.fromARGB(
                                            255,
                                            137,
                                            26,
                                            255,
                                          ),
                                        ),
                              ),
                            ),
                          ),
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
