// To parse this JSON data, do
//
//     final otpBodyModel = otpBodyModelFromJson(jsonString);

import 'dart:convert';

OtpBodyModel otpBodyModelFromJson(String str) => OtpBodyModel.fromJson(json.decode(str));

String otpBodyModelToJson(OtpBodyModel data) => json.encode(data.toJson());

class OtpBodyModel {
    String phoneNumber;
    String otp;

    OtpBodyModel({
        required this.phoneNumber,
        required this.otp,
    });

    factory OtpBodyModel.fromJson(Map<String, dynamic> json) => OtpBodyModel(
        phoneNumber: json["phone_number"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "otp": otp,
    };
}
