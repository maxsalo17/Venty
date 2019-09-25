import 'dart:io';

import 'package:flutter/material.dart';
import 'package:venty/models/locationModel.dart';

class CreateEventModel {
  String name;
  LocationModel location;
  DateTime date;
  TimeOfDay time;
  String price;
  String description;
  File avatar;
  List<File> images;

  CreateEventModel({this.name,this.location,this.date,this.time,this.price,this.description,this.avatar,this.images});

  @override
  String toString() {
    
    return 'Name: $name, Location: ${location.address.toString()}, Date: $date,Time: $time, Price: $price, Description: $description, Avatar: ${avatar.toString()}, Images: ${images.toString()}';
  }
}