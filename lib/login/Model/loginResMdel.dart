// // To parse this JSON data, do
// //
// //     final loginResModel = loginResModelFromJson(jsonString);
// // To parse this JSON data, do
// //
// //     final loginResModel = loginResModelFromJson(jsonString);

// import 'dart:convert';

// LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

// String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

// class LoginResModel {
//     String message;
//     String token;
//     User user;

//     LoginResModel({
//         required this.message,
//         required this.token,
//         required this.user,
//     });

//     factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
//         message: json["message"],
//         token: json["token"],
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "token": token,
//         "user": user.toJson(),
//     };
// }

// class User {
//     int id;
//     String fullName;
//     String phoneNumber;
//     String address;
//     String city;
//     String pincode;
//     DateTime createdAt;
//     DateTime updatedAt;

//     User({
//         required this.id,
//         required this.fullName,
//         required this.phoneNumber,
//         required this.address,
//         required this.city,
//         required this.pincode,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         fullName: json["full_name"],
//         phoneNumber: json["phone_number"],
//         address: json["address"],
//         city: json["city"],
//         pincode: json["pincode"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "full_name": fullName,
//         "phone_number": phoneNumber,
//         "address": address,
//         "city": city,
//         "pincode": pincode,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

class LoginResModel {
  final String message;
  final String token;
  final User user;

  LoginResModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
    message: json["message"] ?? "",
    token: json["token"] ?? "",
    user: User.fromJson(json["user"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String city;
  final String pincode;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.pincode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    fullName: json["full_name"] ?? "",
    phoneNumber: json["phone_number"] ?? "",
    address: json["address"] ?? "",
    city: json["city"] ?? "",
    pincode: json["pincode"] ?? "",
    createdAt:
        json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
    updatedAt:
        json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "phone_number": phoneNumber,
    "address": address,
    "city": city,
    "pincode": pincode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
