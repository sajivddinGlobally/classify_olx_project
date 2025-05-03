// To parse this JSON data, do
//
//     final locationResModel = locationResModelFromJson(jsonString);

import 'dart:convert';

LocationResModel locationResModelFromJson(String str) => LocationResModel.fromJson(json.decode(str));

String locationResModelToJson(LocationResModel data) => json.encode(data.toJson());

class LocationResModel {
    String message;
    Location location;

    LocationResModel({
        required this.message,
        required this.location,
    });

    factory LocationResModel.fromJson(Map<String, dynamic> json) => LocationResModel(
        message: json["message"],
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "location": location.toJson(),
    };
}

class Location {
    String userId;
    double latitude;
    double longitude;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Location({
        required this.userId,
        required this.latitude,
        required this.longitude,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        userId: json["user_id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "latitude": latitude,
        "longitude": longitude,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
