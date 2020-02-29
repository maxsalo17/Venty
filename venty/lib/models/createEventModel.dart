import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:venty/models/categoryModel.dart';
import 'package:venty/models/descriptionBase.dart';
import 'package:venty/models/locationModel.dart';

class CreateEventModel {
  String name;
  LocationModel location;
  DateTime date;
  TimeOfDay time;
  String price;
  List<DescriptionBase> description;
  File avatar;
  Category category;
  List<File> images;

  CreateEventModel(
      {this.name,
      this.location,
      this.date,
      this.time,
      this.price,
      this.description,
      this.avatar,
      this.images,
      this.category});

  Map<String, dynamic> toMap() {
    var desc = [];
    for(DescriptionBase des in description){
      desc.add(des.toMap());
    }

    return {
      "name": name,
      "location": location.toMap(),
      "date": date.millisecondsSinceEpoch,
      "time": "${time?.hour ?? "00"}:${time?.minute ?? "00"}",
      "price": price,
      "description": [...desc] ?? [],
      "category" : category.toMap()
    };
  }

  @override
  String toString() {
    return 'Name: $name, Location: ${location.address.toString()}, Coordinates: ${location?.location.toString()} Date: $date,Time: $time, Price: $price, Description: $description, Avatar: ${avatar.toString()}, Images: ${images.toString()}';
  }
}

