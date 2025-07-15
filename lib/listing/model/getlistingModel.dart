

// To parse this JSON data, do
//
//     final getListingModel = getListingModelFromJson(jsonString);

import 'dart:convert';

GetListingModel getListingModelFromJson(String str) => GetListingModel.fromJson(json.decode(str));

String getListingModelToJson(GetListingModel data) => json.encode(data.toJson());

class GetListingModel {
    bool success;
    Data data;

    GetListingModel({
        required this.success,
        required this.data,
    });

    factory GetListingModel.fromJson(Map<String, dynamic> json) => GetListingModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    List<dynamic> buyList;
    List<SellList> sellList;

    Data({
        required this.buyList,
        required this.sellList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        buyList: List<dynamic>.from(json["buy_list"].map((x) => x)),
        sellList: List<SellList>.from(json["sell_list"].map((x) => SellList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "buy_list": List<dynamic>.from(buyList.map((x) => x)),
        "sell_list": List<dynamic>.from(sellList.map((x) => x.toJson())),
    };
}

class SellList {
    int id;
    int userId;
    String price;
    String latitude;
    String longitude;
    String category;
    String? image;
    String jsonDataRaw;
     Map<String, dynamic> jsonData;
    int status;
    String? rejectionReason;
    DateTime createdAt;
    DateTime updatedAt;

    SellList({
        required this.id,
        required this.userId,
        required this.price,
        required this.latitude,
        required this.longitude,
        required this.category,
        required this.image,
        required this.jsonData,
        required this.status,
        required this.rejectionReason,
        required this.createdAt,
        required this.updatedAt,
        required this.jsonDataRaw,
    });

    factory SellList.fromJson(Map<String, dynamic> json) {
        String raw = json["json_data"] ?? "";
    Map<String, dynamic> parsed = {};
    try {
      parsed = jsonDecode(raw);
    } catch (e) {
      print("Invalid json_data format: $e");
    }

      return SellList(
      
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
        rejectionReason: json["rejection_reason"],
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
        "rejection_reason": rejectionReason,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
