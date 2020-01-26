import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venty/tools/constants.dart';

class LocationModel {
  LatLng location;
  String address;
  LocationModel({this.location, this.address});

  LocationModel.fromMap(Map<String, dynamic> map) {
    this.address = map["address"];
    this.location = LatLng(
        map["location"]["latitude"] ?? ConstantTools.defaultLocation.latitude,
        map["location"]["longitude"] ?? ConstantTools.defaultLocation.latitude);
  }

  Map<String, dynamic> toMap() {
    return {
      "location": {
        "latitude": location?.latitude,
        "longitude": location?.longitude
      },
      "address": address
    };
  }
}
