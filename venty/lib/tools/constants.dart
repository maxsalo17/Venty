import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConstantTools{

  static List monthes = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static const LatLng defaultLocation = LatLng(50.4547, 30.5238);
  static const LatLng kievLocation = LatLng(50.46, 30.524);
  static const LatLng kievLocation2 = LatLng(50.467, 30.521);

  static getMonthName(int month){
    return monthes[month];
  }

  static double itemIconSize = 24;
}