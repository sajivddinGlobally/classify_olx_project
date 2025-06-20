import 'dart:convert';

HomepageModel homepageModelFromJson(String str) =>
    HomepageModel.fromJson(json.decode(str));

String homepageModelToJson(HomepageModel data) =>
    json.encode(data.toJson());

class HomepageModel {
  bool status;
  String location;
  List<Category> categories;
  List<AllProduct> latestListings;
  List<AllProduct> allProducts;

  HomepageModel({
    required this.status,
    required this.location,
    required this.categories,
    required this.latestListings,
    required this.allProducts,
  });

  factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
        status: json["status"],
        location: json["location"],
        categories: List<Category>.from(
          json["categories"].map((x) => Category.fromJson(x)),
        ),
        latestListings: List<AllProduct>.from(
          json["latest_listings"].map((x) => AllProduct.fromJson(x)),
        ),
        allProducts: List<AllProduct>.from(
          json["all_products"].map((x) => AllProduct.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "location": location,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "latest_listings":
            List<dynamic>.from(latestListings.map((x) => x.toJson())),
        "all_products": List<dynamic>.from(allProducts.map((x) => x.toJson())),
      };
}

class AllProduct {
  int id;
  int userId;
  String price;
  String latitude;
  String longitude;
  String category;
  String image;
  String jsonDataRaw; // raw string from API
  Map<String, dynamic> jsonData; // parsed map
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int distance;
  int likes;
  int dislikes;

  AllProduct({
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
    required this.distance,
    required this.likes,
    required this.dislikes,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    final raw = json["json_data"] ?? "";
    Map<String, dynamic> parsed = {};

    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map<String, dynamic>) {
        parsed = decoded;
      }
    } catch (e) {
      print("Invalid json_data: $e");
    }

    return AllProduct(
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
      distance: json["distance"],
      likes: json["likes"],
      dislikes: json["dislikes"],
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
        "distance": distance,
        "likes": likes,
        "dislikes": dislikes,
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
