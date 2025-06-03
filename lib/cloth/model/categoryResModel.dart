// To parse this JSON data, do
//
//     final categoryResModel = categoryResModelFromJson(jsonString);

import 'dart:convert';

CategoryResModel categoryResModelFromJson(String str) => CategoryResModel.fromJson(json.decode(str));

String categoryResModelToJson(CategoryResModel data) => json.encode(data.toJson());

class CategoryResModel {
    bool success;
    String message;
    List<Datum> data;

    CategoryResModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory CategoryResModel.fromJson(Map<String, dynamic> json) => CategoryResModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    String category;
    String image;
    String jsonData;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.userId,
        required this.category,
        required this.image,
        required this.jsonData,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        image: json["image"],
        jsonData: json["json_data"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "image": image,
        "json_data": jsonData,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
