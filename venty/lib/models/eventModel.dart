import 'package:flutter/material.dart';
import 'package:venty/models/categoryModel.dart';

import 'locationModel.dart';

class EventModel {
  String name;
  LocationModel location;
  DateTime date;
  String time;
  String price;
  String description;
  String avatar;
  List<String> images;
  Category category;
  bool isFollowed;

  EventModel({this.name,this.location,this.date,this.time,this.price,this.description,this.avatar,this.images, this.isFollowed, this.category});

  EventModel.fromMap(Map<String, dynamic> map){
    this.name = map["name"];
    this.location = LocationModel.fromMap(Map<String, dynamic>.from(map["location"]));
    this.date = DateTime.fromMillisecondsSinceEpoch(map["date"]);
    this.time = map["time"];
    this.price = map["price"];
    this.description = map["description"];
    this.avatar = map["avatar"];
    this.images = (map["images"] as List).map((item) => item.toString()).toList();
    this.category = Category.fromMap(Map<String, dynamic>.from(map["category"]));
  }

  @override
  String toString() {
    
    return 'Name: $name, Location: ${location.address.toString()}, Coordinates: ${location?.location.toString()}, Date: $date,Time: $time, Price: $price, Description: $description, Avatar: ${avatar.toString()}, Images: ${images.toString()}';
  }
}