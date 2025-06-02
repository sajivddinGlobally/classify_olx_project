// // To parse this JSON data, do
// //
// //     final particularProductModel = particularProductModelFromJson(jsonString);

// import 'dart:convert';

// ParticularProductModel particularProductModelFromJson(String str) => ParticularProductModel.fromJson(json.decode(str));

// String particularProductModelToJson(ParticularProductModel data) => json.encode(data.toJson());

// class ParticularProductModel {
//     String status;
//     String message;
//     Data data;

//     ParticularProductModel({
//         required this.status,
//         required this.message,
//         required this.data,
//     });

//     factory ParticularProductModel.fromJson(Map<String, dynamic> json) => ParticularProductModel(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     int id;
//     String category;
//     String name;
//     int price;
//     String contact;
//     String pincode;
//     String description;
//     DateTime createdAt;
//     DateTime updatedAt;
//     List<Specification> specification;
//     List<Image> images;

//     Data({
//         required this.id,
//         required this.category,
//         required this.name,
//         required this.price,
//         required this.contact,
//         required this.pincode,
//         required this.description,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.specification,
//         required this.images,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         category: json["category"],
//         name: json["name"],
//         price: json["price"],
//         contact: json["contact"],
//         pincode: json["pincode"],
//         description: json["description"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         specification: List<Specification>.from(json["specification"].map((x) => Specification.fromJson(x))),
//         images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "category": category,
//         "name": name,
//         "price": price,
//         "contact": contact,
//         "pincode": pincode,
//         "description": description,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "specification": List<dynamic>.from(specification.map((x) => x.toJson())),
//         "images": List<dynamic>.from(images.map((x) => x.toJson())),
//     };
// }

// class Image {
//     int id;
//     int productId;
//     String images;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String imageUrl;

//     Image({
//         required this.id,
//         required this.productId,
//         required this.images,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.imageUrl,
//     });

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         productId: json["product_id"],
//         images: json["images"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         imageUrl: json["image_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "product_id": productId,
//         "images": images,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "image_url": imageUrl,
//     };
// }

// class Specification {
//     int id;
//     int productId;
//     String material;
//     String sizeOrShoeNumber;
//     String ageOrHowOld;
//     String model;
//     String idealFor;
//     String style;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Specification({
//         required this.id,
//         required this.productId,
//         required this.material,
//         required this.sizeOrShoeNumber,
//         required this.ageOrHowOld,
//         required this.model,
//         required this.idealFor,
//         required this.style,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Specification.fromJson(Map<String, dynamic> json) => Specification(
//         id: json["id"],
//         productId: json["product_id"],
//         material: json["material"],
//         sizeOrShoeNumber: json["size_or_shoe_number"],
//         ageOrHowOld: json["age_or_how_old"],
//         model: json["model"],
//         idealFor: json["ideal_for"],
//         style: json["style"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "product_id": productId,
//         "material": material,
//         "size_or_shoe_number": sizeOrShoeNumber,
//         "age_or_how_old": ageOrHowOld,
//         "model": model,
//         "ideal_for": idealFor,
//         "style": style,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }


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
