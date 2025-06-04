import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopping_app_olx/globalkey/navigatorkey.dart';
import 'package:shopping_app_olx/login/login.page.dart';

Dio createDio() {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  var box = Hive.box("data");
  var token = box.get("token");

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Retrieve token before sending request
        options.headers.addAll({
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
          if (token != null) 'Authorization': 'Bearer $token',
        });
        handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response!.requestOptions.path.contains("/api/auth/verifyOtp")) {  // ye code sirf agar wrong otp dalne par navigat nhi hoga 
          log("OTP verification failed - Invalid OTP");   
          handler.next(e); // Just forward the error, no navigation
          return;
        }
        if (e.response?.statusCode == 401) {
          log("Token expire refreshing");
          //log(e.response?.data['message']);
          Fluttertoast.showToast(msg: "Token expire please login");
          // ✅ Use the global navigator key
          navigatorKey.currentState?.pushAndRemoveUntil(
            CupertinoPageRoute(builder: (_) => LoginPage()),
            (_) => false,
          );
          return;
        } else {
          handler.next(e);
        }
      },
    ),
  );

  return dio;
}
