import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venty/models/locationModel.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/progressIndicator.dart';

class MapSelector extends StatefulWidget {
  Function(LocationModel) onSubmit;

  MapSelector({this.onSubmit});
  @override
  _MapSelectorState createState() => _MapSelectorState();
}

class _MapSelectorState extends State<MapSelector> {
  List<Marker> _markers;
  List<Address> _address;
  Position _position;
  GoogleMapController _controller;

  _setMarker(LatLng position) async {
    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude));
    setState(() {
      _markers = List<Marker>();
      _markers.add(Marker(
          markerId: MarkerId('0'),
          position: LatLng(position.latitude, position.longitude)));
      _controller.animateCamera(CameraUpdate.newLatLng(position));
      _address = address;
    });

    if (_address.isEmpty) {
      print("No address found");
    } else {
      print(_address[0].addressLine);
    }
  }

  _getCurrentLocation() async {
    if (await Geolocator().isLocationServiceEnabled() == false) {
    } else {
      var position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      setState(() {
        _position = position;
        _markers = List<Marker>();
        _markers.add(Marker(
            markerId: MarkerId('0'),
            position: LatLng(position.latitude, position.longitude)));
      });
      print('Latitude ${_position.latitude}');
    }
  }

  bool _checkPosition() {
    return _position != null && _position.latitude != null;
  }

  _submit() {
    if (_address != null && _address.isNotEmpty) {
      Address place = _address[0];
      LocationModel locationModel = LocationModel(
          location: LatLng(_position.latitude, _position.longitude),
          address:
              '${place.featureName}, ${place.thoroughfare}, ${place.locality}, ${place.countryName}');
      if (widget.onSubmit != null) widget.onSubmit(locationModel);
    }
  }

  @override
  void initState() {
    // _position = Position(latitude: 0.0,longitude: 0.0);
    _getCurrentLocation();
    super.initState();
  }

  Widget _buildMap(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          markers: Set<Marker>.from(_markers),
          initialCameraPosition: CameraPosition(
            target: LatLng(_position.latitude, _position.longitude),
            zoom: 14.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          onTap: _setMarker,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5.0,
              child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Set marker on event place'),
                  )),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildInfo(context),
        )
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(14.0),
      iconSize: 40.0,
      icon: Icon(Icons.done, color: VentyColors.primaryRed),
      onPressed: () {
        _submit();
        Navigator.pop(context);
      },
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40.0,
              width: 40.0,
              child: VentyProgressIndicator(),
            ),
          ),
          Container(
            width: 200,
            child: Text(
              'Detecting current location...Maybe you forgot to enable geolocation service',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: VentyColors.primaryDark,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    Address place;
    if (_address != null && _address.isNotEmpty) {
      place = _address[0];
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: place != null
          ? Material(
              elevation: 5.0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: ListTile(
                        title: Text('Event address:'),
                        subtitle: Text(
                            '${place.featureName}, ${place.thoroughfare}, ${place.locality}'),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Center(child: _buildSubmitButton(context)))
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width - 24,
          child: _checkPosition() ? _buildMap(context) : _buildLoading()),
    );
  }
}
