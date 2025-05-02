// To parse this JSON data, do
//
//     final otpResModel = otpResModelFromJson(jsonString);

import 'dart:convert';

OtpResModel otpResModelFromJson(String str) => OtpResModel.fromJson(json.decode(str));

String otpResModelToJson(OtpResModel data) => json.encode(data.toJson());

class OtpResModel {
    String message;

    OtpResModel({
        required this.message,
    });

    factory OtpResModel.fromJson(Map<String, dynamic> json) => OtpResModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
