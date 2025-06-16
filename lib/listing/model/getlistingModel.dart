// To parse this JSON data, do
//
//     final getLitingModel = getLitingModelFromJson(jsonString);

import 'dart:convert';

GetLitingModel getLitingModelFromJson(String str) => GetLitingModel.fromJson(json.decode(str));

String getLitingModelToJson(GetLitingModel data) => json.encode(data.toJson());

class GetLitingModel {
    bool success;
    Data data;

    GetLitingModel({
        required this.success,
        required this.data,
    });

    factory GetLitingModel.fromJson(Map<String, dynamic> json) => GetLitingModel(
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
    String category;
    String image;
    String jsonData;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    SellList({
        required this.id,
        required this.userId,
        required this.category,
        required this.image,
        required this.jsonData,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SellList.fromJson(Map<String, dynamic> json) => SellList(
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
