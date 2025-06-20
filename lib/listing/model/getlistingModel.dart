import 'dart:convert';

GetListingModel getListingModelFromJson(String str) =>
    GetListingModel.fromJson(json.decode(str));

String getListingModelToJson(GetListingModel data) =>
    json.encode(data.toJson());

class GetListingModel {
  bool success;
  GetListingData data;

  GetListingModel({
    required this.success,
    required this.data,
  });

  factory GetListingModel.fromJson(Map<String, dynamic> json) =>
      GetListingModel(
        success: json["success"],
        data: GetListingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class GetListingData {
  List<dynamic> buyList;
  List<ListingProduct> sellList;

  GetListingData({
    required this.buyList,
    required this.sellList,
  });

  factory GetListingData.fromJson(Map<String, dynamic> json) =>
      GetListingData(
        buyList: List<dynamic>.from(json["buy_list"]),
        sellList: List<ListingProduct>.from(
            json["sell_list"].map((x) => ListingProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "buy_list": buyList,
        "sell_list": List<dynamic>.from(sellList.map((x) => x.toJson())),
      };
}

class ListingProduct {
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

  ListingProduct({
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
  });

  factory ListingProduct.fromJson(Map<String, dynamic> json) {
    String raw = json["json_data"] ?? "";
    Map<String, dynamic> parsed = {};
    try {
      parsed = jsonDecode(raw);
    } catch (e) {
      print("Invalid json_data format: $e");
    }

    return ListingProduct(
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
      };
}
