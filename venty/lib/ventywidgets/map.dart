import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venty/tools/constants.dart';

class AnimatedMap extends StatefulWidget {
  LatLng pin;
  AnimatedMap({this.pin});
  @override
  State<AnimatedMap> createState() => AnimatedMapState();
}

class AnimatedMapState extends State<AnimatedMap> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = List<Marker>();
  BitmapDescriptor icon;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: ConstantTools.defaultLocation,
    zoom: 14,
  );

  @override
  void didUpdateWidget(AnimatedMap oldWidget) {
      _setMarker(widget.pin);
      _goToPin(widget.pin);
      print("Moving to position ${widget.pin.toString()}");
    
  }

   @override
  void initState() {
    // _position = Position(latitude: 0.0,longitude: 0.0);
   _setMarker(widget.pin ?? ConstantTools.defaultLocation);
    super.initState();
  }

  _setMarker(LatLng pin) async {
    icon = icon ?? await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(45.0,45.0)), "images/Pin.png");
    _markers.clear();
    setState(() {
      _markers.add(Marker(markerId: MarkerId("Main pin"), position: pin, icon: icon));
    });
  }

  

  Future<void> _goToPin(LatLng pin) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: pin, zoom: 14)));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.only(top: 50),
      markers: Set<Marker>.from(_markers),
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
