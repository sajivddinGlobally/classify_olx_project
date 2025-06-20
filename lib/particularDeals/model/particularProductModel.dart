import 'dart:convert';

ParticularProductModel particularProductModelFromJson(String str) =>
    ParticularProductModel.fromJson(json.decode(str));

String particularProductModelToJson(ParticularProductModel data) =>
    json.encode(data.toJson());

class ParticularProductModel {
  String status;
  String message;
  ParticularProductData data;

  ParticularProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ParticularProductModel.fromJson(Map<String, dynamic> json) =>
      ParticularProductModel(
        status: json["status"],
        message: json["message"],
        data: ParticularProductData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class ParticularProductData {
  int id;
  int userId;
  String price;
  String latitude;
  String longitude;
  String category;
  String image;
  String jsonDataRaw;
  Map<String, dynamic> jsonData;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> specification;
  List<dynamic> images;

  ParticularProductData({
    required this.id,
    required this.userId,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.image,
    required this.jsonDataRaw,
    required this.jsonData,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.specification,
    required this.images,
  });

  factory ParticularProductData.fromJson(Map<String, dynamic> json) {
    String raw = json["json_data"] ?? "";
    Map<String, dynamic> parsed = {};
    try {
      parsed = jsonDecode(raw);
    } catch (e) {
      parsed = {};
    }

    return ParticularProductData(
      id: json["id"],
      userId: json["user_id"],
      price: json["price"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      category: json["category"],
      image: json["image"],
      jsonDataRaw: raw,
      jsonData: parsed,
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      specification: List<dynamic>.from(json["specification"]),
      images: List<dynamic>.from(json["images"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "price": price,
        "latitude": latitude,
        "longitude": longitude,
        "category": category,
        "image": image,
        "json_data": jsonDataRaw,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "specification": specification,
        "images": images,
      };
}
