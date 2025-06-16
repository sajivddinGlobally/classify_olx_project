// To parse this JSON data, do
//
//     final homepageModel = homepageModelFromJson(jsonString);

import 'dart:convert';

HomepageModel homepageModelFromJson(String str) => HomepageModel.fromJson(json.decode(str));

String homepageModelToJson(HomepageModel data) => json.encode(data.toJson());

class HomepageModel {
    String location;
    List<Category> categories;
    List<AllProduct> latestListings;
    List<AllProduct> allProducts;

    HomepageModel({
        required this.location,
        required this.categories,
        required this.latestListings,
        required this.allProducts,
    });

    factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
        location: json["location"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        latestListings: List<AllProduct>.from(json["latest_listings"].map((x) => AllProduct.fromJson(x))),
        allProducts: List<AllProduct>.from(json["all_products"].map((x) => AllProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "latest_listings": List<dynamic>.from(latestListings.map((x) => x.toJson())),
        "all_products": List<dynamic>.from(allProducts.map((x) => x.toJson())),
    };
}

class AllProduct {
    int id;
    int userId;
    String category;
    String image;
    String jsonData;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    AllProduct({
        required this.id,
        required this.userId,
        required this.category,
        required this.image,
        required this.jsonData,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
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

class Category {
    int id;
    String title;
    String imageUrl;
    DateTime createdAt;
    DateTime updatedAt;

    Category({
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
