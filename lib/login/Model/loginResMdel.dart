// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String message;
    int otpForTesting;

    LoginResModel({
        required this.message,
        required this.otpForTesting,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        message: json["message"],
        otpForTesting: json["otp_for_testing"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "otp_for_testing": otpForTesting,
    };
}
