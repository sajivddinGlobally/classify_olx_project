// To parse this JSON data, do
//
//     final getAllProductModel = getAllProductModelFromJson(jsonString);

import 'dart:convert';

GetAllProductModel getAllProductModelFromJson(String str) => GetAllProductModel.fromJson(json.decode(str));

String getAllProductModelToJson(GetAllProductModel data) => json.encode(data.toJson());

class GetAllProductModel {
    String status;
    String message;
    List<Datum> data;

    GetAllProductModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetAllProductModel.fromJson(Map<String, dynamic> json) => GetAllProductModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String category;
    String name;
    int price;
    String contact;
    String pincode;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.category,
        required this.name,
        required this.price,
        required this.contact,
        required this.pincode,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        name: json["name"],
        price: json["price"],
        contact: json["contact"],
        pincode: json["pincode"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "name": name,
        "price": price,
        "contact": contact,
        "pincode": pincode,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
