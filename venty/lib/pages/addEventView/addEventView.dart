import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong/latlong.dart';
import 'package:venty/bloc/createEventBloc.dart';
import 'package:venty/models/locationModel.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/GradientButton.dart';
import 'package:venty/ventywidgets/beautifulButton.dart';
import 'package:venty/ventywidgets/datePickerField.dart';
import 'package:venty/ventywidgets/mapSelector.dart';
import 'package:venty/ventywidgets/timePickerField.dart';

class AddEventView extends StatefulWidget {
  @override
  _AddEventViewState createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  File picture;
  CreateEventBloc bloc = new CreateEventBloc();
  LocationModel location;
  _pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    bloc.avatarValue(image);
  }

  _getLocation(BuildContext context) async {
    showDialog(
        context: context, child: MapSelector(onSubmit: bloc.locationValue));
  }

  @override
  void initState() {
    bloc.initializeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black87),
                actionsIconTheme:
                    IconThemeData(color: VentyColors.primaryDark))),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: <Widget>[
               IconButton(
                icon: Icon(Icons.done,color: VentyColors.primaryDark),
                onPressed: () {
                  bloc.setEvent();
                },
              ),
            ],
            title: Text("Create event",style: TextStyle(color: VentyColors.primaryDark)),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,color: VentyColors.primaryDark),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Stack(
              children: <Widget>[
                Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
          child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.white,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          elevation: 7.0,
                          child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              gradient: new LinearGradient(
                                colors: [
                                  Color.fromRGBO(255, 79, 85, 1),
                                  Color.fromRGBO(170, 39, 41, 1)
                                ],
                                begin: FractionalOffset.centerRight,
                                end: FractionalOffset.centerLeft,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  child: StreamBuilder<File>(
                                      stream: bloc.avatar,
                                      builder: (context, snapshot) {
                                        return Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: snapshot.data == null
                                              ? SizedBox()
                                              : Image.file(snapshot.data,
                                                  fit: BoxFit.cover),
                                        );
                                      }),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  child: new Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              Colors.black.withOpacity(0.0),
                                              Colors.black.withOpacity(0.5)
                                            ])),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: RaisedButton(
                                      elevation: 0.0,
                                      color: Colors.transparent,
                                      onPressed: () {
                                        _pickImage();
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 22.0),
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            child: StreamBuilder<String>(
                                                stream: bloc.name,
                                                builder: (context, snapshot) {
                                                  return TextField(
                                                    onChanged: bloc.nameValue,
                                                    decoration: InputDecoration(
                                                        hintText: "Event name",
                                                        border: InputBorder.none,
                                                        errorText: snapshot.error),
                                                    style: TextStyle(
                                                      fontSize: 28.0,
                                                      fontFamily: 'Segoe UI',
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  );
                                                }),
                                            width: MediaQuery.of(context).size.width *
                                                0.6,
                                          ),
                                          StreamBuilder<LocationModel>(
                                              stream: bloc.location,
                                              builder: (context, snapshot) {
                                                return snapshot.data == null
                                                    ? Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(vertical: 8.0),
                                                        child: Material(
                                                          elevation: 3.0,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      200.0)),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        200.0)),
                                                            child: Container(
                                                                height: 35.0,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              50.0)),
                                                                ),
                                                                child:
                                                                    BeautifulButton(
                                                                  height: 35.0,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.35,
                                                                  onPressed: () {
                                                                    _getLocation(
                                                                        context);
                                                                  },
                                                                  text: 'Location',
                                                                  icon: Icons.map,
                                                                )),
                                                          ),
                                                        ))
                                                    : Container(
                                                        alignment:
                                                            Alignment.centerLeft,
                                                        width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                        child: FlatButton(
                                                            padding:
                                                                EdgeInsets.all(0),
                                                            onPressed: () {
                                                              _getLocation(context);
                                                            },
                                                            child: Text(
                                                              snapshot.data.address,
                                                              style: TextStyle(
                                                                fontSize: 15.0,
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                fontWeight:
                                                                    FontWeight.w200,
                                                                color: Colors.white,
                                                              ),
                                                            )),
                                                      );
                                              })
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 7.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(children: [
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                title: Text(
                                  'Event date and time',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontFamily: 'Segoe UI',
                                    fontWeight: FontWeight.bold,
                                    color: VentyColors.primaryDark,
                                  ),
                                ),
                              ),
                              StreamBuilder<DateTime>(
                                  stream: bloc.date,
                                  builder: (context, snapshot) {
                                    return DatePicker(onChange: bloc.dateValue);
                                  }),
                              StreamBuilder<TimeOfDay>(
                                  stream: bloc.time,
                                  builder: (context, snapshot) {
                                    return TimePicker(
                                      onChange: bloc.timeValue,
                                    );
                                  })
                            ]),
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<bool>(
                        stream: bloc.switchstream,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Material(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              elevation: 7.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 0),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Price',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.bold,
                                              color: VentyColors.primaryDark,
                                            ),
                                          ),
                                          Text(
                                            'Switch toggle to change free/paid',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.w200,
                                              color: VentyColors.primaryDark,
                                            ),
                                          ),
                                          Switch(
                                            value: snapshot.hasData
                                                ? snapshot.data
                                                : false,
                                            onChanged: bloc.switchValue,
                                            activeColor: Colors.white,
                                            activeTrackColor: VentyColors.primaryRed,
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.attach_money,
                                          color: VentyColors.primaryRed),
                                      title: Container(
                                        width:
                                            MediaQuery.of(context).size.width * 0.9,
                                        child: snapshot.data == true
                                            ? TextField(
                                                onChanged: bloc.priceValue,
                                                keyboardType: TextInputType.number,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                    hintText: "Ticket price",
                                                    border: InputBorder.none),
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Segoe UI',
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              )
                                            : Text(
                                                "Free",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Segoe UI',
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 7.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text("Description",style : TextStyle(
                                              fontSize: 22.0,
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.bold,
                                              color: VentyColors.primaryDark,
                                            ),),
                                        subtitle:ListTile(
                                    leading: Icon(Icons.description,
                                        color: VentyColors.primaryRed),
                                    title: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                          hintText: "Enter event description",
                                          border: InputBorder.none),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Segoe UI',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 7.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(children: [
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                title: Text(
                                  'Submit event?',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontFamily: 'Segoe UI',
                                    fontWeight: FontWeight.bold,
                                    color: VentyColors.primaryDark,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RaisedGradientButton(
                                        child: Text('Yes',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "Segoe UI",
                                                fontWeight: FontWeight.w600)),
                                        width: 150,
                                        gradient: new LinearGradient(
                                          colors: [
                                            Color.fromRGBO(255, 79, 85, 1),
                                            Color.fromRGBO(148, 39, 41, 1)
                                          ],
                                          begin: FractionalOffset.centerRight,
                                          end: FractionalOffset.centerLeft,
                                        ),
                                        onPressed: bloc.setEvent,
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(40)),
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          child: FlatButton(
                                            child: Text('No',
                                                style: TextStyle(
                                                    color: VentyColors.primaryDark,
                                                    fontSize: 20,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600)),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
          ),
        ),
                ),
          //        SizedBox(
          //   height: 80,
          //             child: AppBar(
          //     leading: IconButton(
          //       icon: Icon(Icons.arrow_back_ios,color: Colors.white),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //     backgroundColor: Colors.transparent,
          //     elevation: 0.0,
          //   ),
          // )
              ],
              
            )
            ));
  }
}
