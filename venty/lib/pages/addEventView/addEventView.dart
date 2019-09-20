import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/datePickerField.dart';
import 'package:venty/ventywidgets/timePickerField.dart';

class AddEventView extends StatefulWidget {
  @override
  _AddEventViewState createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  @override
  Widget build(BuildContext context) {
    return Theme(
          data: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0, iconTheme: IconThemeData(color: Colors.black87), actionsIconTheme: IconThemeData(color: VentyColors.primaryDark))
          ),
          child: Scaffold(
        appBar: AppBar(title: Text("Create event", style: TextStyle(color: VentyColors.primaryDark),), centerTitle: true,),
        body:
        new Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.86), BlendMode.lighten),
                  image: new AssetImage("images/Background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DatePicker(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TimePicker(),
                ),
                Container(
                  height: 300.0,
                  child: FlutterMap(options: new MapOptions(
                    center: LatLng(51.5, -0.09),
                    zoom: 5.0,
                    minZoom: 3.0,
                    maxZoom:10.0
                  ),
                  layers:[ new TileLayerOptions(
                    urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c']),
                  ],
                                  ),
                )
              ],
            ),
          ),
        ),
      ),)
    );
  }
}