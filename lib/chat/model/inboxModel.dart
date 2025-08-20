// To parse this JSON data, do
//
//     final inboxListResponse = inboxListResponseFromJson(jsonString);

import 'dart:convert';

InboxListResponse inboxListResponseFromJson(String str) => InboxListResponse.fromJson(json.decode(str));

String inboxListResponseToJson(InboxListResponse data) => json.encode(data.toJson());

class InboxListResponse {
    String message;
    List<Inbox> inbox;
    int status;

    InboxListResponse({
        required this.message,
        required this.inbox,
        required this.status,
    });

    factory InboxListResponse.fromJson(Map<String, dynamic> json) => InboxListResponse(
        message: json["message"],
        inbox: List<Inbox>.from(json["inbox"].map((x) => Inbox.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "inbox": List<dynamic>.from(inbox.map((x) => x.toJson())),
        "status": status,
    };
}

class Inbox {
    String conversationId;
    OtherUser otherUser;
    String lastMessage;
    DateTime timestamp;

    Inbox({
        required this.conversationId,
        required this.otherUser,
        required this.lastMessage,
        required this.timestamp,
    });

    factory Inbox.fromJson(Map<String, dynamic> json) => Inbox(
        conversationId: json["conversation_id"],
        otherUser: OtherUser.fromJson(json["other_user"]),
        lastMessage: json["last_message"],
        timestamp: DateTime.parse(json["timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "conversation_id": conversationId,
        "other_user": otherUser.toJson(),
        "last_message": lastMessage,
        "timestamp": timestamp.toIso8601String(),
    };
}

class OtherUser {
    int id;
    String name;
    String? profilePick;

    OtherUser({
        required this.id,
        required this.name,
        required this.profilePick,
    });

    factory OtherUser.fromJson(Map<String, dynamic> json) => OtherUser(
        id: json["_id"],
        name: json["name"],
        profilePick: json["profilePick"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "profilePick": profilePick,
    };
}
