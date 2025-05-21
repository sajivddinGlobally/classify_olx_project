// // To parse this JSON data, do
// //
// //     final homepageModel = homepageModelFromJson(jsonString);

// import 'dart:convert';

// HomepageModel homepageModelFromJson(String str) => HomepageModel.fromJson(json.decode(str));

// String homepageModelToJson(HomepageModel data) => json.encode(data.toJson());

// class HomepageModel {
//     String location;
//     List<Category> categories;
//     List<AllProduct> latestListings;
//     List<AllProduct> allProducts;

//     HomepageModel({
//         required this.location,
//         required this.categories,
//         required this.latestListings,
//         required this.allProducts,
//     });

//     factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
//         location: json["location"],
//         categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//         latestListings: List<AllProduct>.from(json["latest_listings"].map((x) => AllProduct.fromJson(x))),
//         allProducts: List<AllProduct>.from(json["all_products"].map((x) => AllProduct.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "location": location,
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "latest_listings": List<dynamic>.from(latestListings.map((x) => x.toJson())),
//         "all_products": List<dynamic>.from(allProducts.map((x) => x.toJson())),
//     };
// }

// class AllProduct {
//     int id;
//     String category;
//     String name;
//     int price;
//     String contact;
//     String pincode;
//     String description;
//     String image;
//     String? address;
//     DateTime createdAt;
//     DateTime updatedAt;

//     AllProduct({
//         required this.id,
//         required this.category,
//         required this.name,
//         required this.price,
//         required this.contact,
//         required this.pincode,
//         required this.description,
//         required this.image,
//         required this.address,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
//         id: json["id"],
//         category: json["category"],
//         name: json["name"],
//         price: json["price"],
//         contact: json["contact"],
//         pincode: json["pincode"],
//         description: json["description"],
//         image: json["image"],
//         address: json["address"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "category": category,
//         "name": name,
//         "price": price,
//         "contact": contact,
//         "pincode": pincode,
//         "description": description,
//         "image": image,
//         "address": address,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// class Category {
//     int id;
//     String title;
//     String imageUrl;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Category({
//         required this.id,
//         required this.title,
//         required this.imageUrl,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         title: json["title"],
//         imageUrl: json["image_url"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image_url": imageUrl,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }



class HomepageModel {
  final String location;
  final List<Category> categories;
  final List<Listing> latestListings;
  final List<Product> allProducts;

  HomepageModel({
    required this.location,
    required this.categories,
    required this.latestListings,
    required this.allProducts,
  });

  factory HomepageModel.fromJson(Map<String, dynamic> json) {
    return HomepageModel(
      location: json['location'],
      categories: List<Category>.from(
        json['categories'].map((x) => Category.fromJson(x)),
      ),
      latestListings: List<Listing>.from(
        json['latest_listings'].map((x) => Listing.fromJson(x)),
      ),
      allProducts: List<Product>.from(
        json['all_products'].map((x) => Product.fromJson(x)),
      ),
    );
  }
}

class Category {
  final int id;
  final String title;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Listing {
  final int id;
  final String category;
  final String name;
  final int price;
  final String contact;
  final String pincode;
  final String description;
  final String image;
  final String address;
  final String createdAt;
  final String updatedAt;

  Listing({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.contact,
    required this.pincode,
    required this.description,
    required this.image,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      price: json['price'],
      contact: json['contact'],
      pincode: json['pincode'],
      description: json['description'],
      image: json['image'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final String contact;
  final String pincode;
  final String description;
  final String image;
  final String address;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.contact,
    required this.pincode,
    required this.description,
    required this.image,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      price: json['price'],
      contact: json['contact'],
      pincode: json['pincode'],
      description: json['description'],
      image: json['image'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
