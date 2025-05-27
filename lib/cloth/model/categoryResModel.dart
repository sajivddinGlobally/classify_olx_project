// // To parse this JSON data, do
// //
// //     final categoryResModel = categoryResModelFromJson(jsonString);

// import 'dart:convert';

// CategoryResModel categoryResModelFromJson(String str) => CategoryResModel.fromJson(json.decode(str));

// String categoryResModelToJson(CategoryResModel data) => json.encode(data.toJson());

// class CategoryResModel {
//     bool success;
//     String message;
//     List<Datum> data;

//     CategoryResModel({
//         required this.success,
//         required this.message,
//         required this.data,
//     });

//     factory CategoryResModel.fromJson(Map<String, dynamic> json) => CategoryResModel(
//         success: json["success"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     int id;
//     String category;
//     String name;
//     int price;
//     String contact;
//     String pincode;
//     String description;
//     String image;
//     String address;
//     int status;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Datum({
//         required this.id,
//         required this.category,
//         required this.name,
//         required this.price,
//         required this.contact,
//         required this.pincode,
//         required this.description,
//         required this.image,
//         required this.address,
//         required this.status,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         category: json["category"],
//         name: json["name"],
//         price: json["price"],
//         contact: json["contact"],
//         pincode: json["pincode"],
//         description: json["description"],
//         image: json["image"],
//         address: json["address"],
//         status: json["status"],
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
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }
