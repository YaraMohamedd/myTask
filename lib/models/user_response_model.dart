

import 'dart:convert';

UserResponseModel userFromJson(String str) => UserResponseModel.fromJson(json.decode(str));

String userToJson(UserResponseModel data) => json.encode(data.toJson());

class UserResponseModel {
  UserResponseModel({
    this.result,
    this.user,
  });

  bool result;
  User user;

  UserResponseModel copyWith({
    bool result,
    User user,
  }) =>
      UserResponseModel(
        result: result ?? this.result,
        user: user ?? this.user,
      );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
    result: json["result"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.apiToken,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String username;
  String email;
  String phone;
  dynamic emailVerifiedAt;
  String apiToken;
  DateTime createdAt;
  DateTime updatedAt;

  User copyWith({
    int id,
    String username,
    String email,
    String phone,
    dynamic emailVerifiedAt,
    String apiToken,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        apiToken: apiToken ?? this.apiToken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
