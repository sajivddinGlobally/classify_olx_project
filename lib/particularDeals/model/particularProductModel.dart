// To parse this JSON data, do
//
//     final particularProductModel = particularProductModelFromJson(jsonString);

import 'dart:convert';

ParticularProductModel particularProductModelFromJson(String str) => ParticularProductModel.fromJson(json.decode(str));

String particularProductModelToJson(ParticularProductModel data) => json.encode(data.toJson());

class ParticularProductModel {
    String status;
    String message;
    Data data;

    ParticularProductModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ParticularProductModel.fromJson(Map<String, dynamic> json) => ParticularProductModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int userId;
    String category;
    String image;
    String jsonData;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> specification;
    List<dynamic> images;

    Data({
        required this.id,
        required this.userId,
        required this.category,
        required this.image,
        required this.jsonData,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.specification,
        required this.images,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        image: json["image"],
        jsonData: json["json_data"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        specification: List<dynamic>.from(json["specification"].map((x) => x)),
        images: List<dynamic>.from(json["images"].map((x) => x)),
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
        "specification": List<dynamic>.from(specification.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
