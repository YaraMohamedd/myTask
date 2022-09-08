

import 'dart:convert';

HomeResponseModel homeFromJson(String str) => HomeResponseModel.fromJson(json.decode(str));

String homeToJson(HomeResponseModel data) => json.encode(data.toJson());

class HomeResponseModel {
  HomeResponseModel({
    this.result,
    this.restaurants,
  });

  bool result;
  List<Restaurant> restaurants;

  HomeResponseModel copyWith({
    bool result,
    List<Restaurant> restaurants,
  }) =>
      HomeResponseModel(
        result: result ?? this.result,
        restaurants: restaurants ?? this.restaurants,
      );

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) => HomeResponseModel(
    result: json["result"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    this.name,
    this.image,
  });

  String name;
  String image;

  Restaurant copyWith({
    String name,
    String image,
  }) =>
      Restaurant(
        name: name ?? this.name,
        image: image ?? this.image,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
