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
    String jsonDataRaw;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    Map<String, dynamic> jsonData;
    String price;

    Datum({
        required this.id,
        required this.userId,
        required this.category,
        required this.image,
        required this.jsonDataRaw,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.jsonData,
        required this.price
    });

    factory Datum.fromJson(Map<String, dynamic> json) {
      final raw = json["json_data"] ?? "";
      Map<String, dynamic> parsed = {};

      try{
        final decoded = jsonDecode(raw);
        if ( decoded is Map<String, dynamic>){
          parsed = decoded;
        }

      } catch (e) {
      // log("Invalid json_data: $e");
      }

      return Datum(
      
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        image: json["image"],
        jsonData: parsed,
        jsonDataRaw: raw,
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        price: json['price']
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "image": image,
        "json_data": jsonData,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "price": price
    };
}
