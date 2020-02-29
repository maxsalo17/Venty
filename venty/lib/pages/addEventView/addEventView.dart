import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong/latlong.dart';
import 'package:venty/bloc/createEventBloc.dart';
import 'package:venty/bloc/descriptionBloc.dart';
import 'package:venty/models/categoryModel.dart';
import 'package:venty/models/locationModel.dart';
import 'package:venty/pages/addDescriptionView/addDescription.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/GradientButton.dart';
import 'package:venty/ventywidgets/beautifulButton.dart';
import 'package:venty/ventywidgets/datePickerField.dart';
import 'package:venty/ventywidgets/mapSelector.dart';
import 'package:venty/ventywidgets/materialTile.dart';
import 'package:venty/ventywidgets/multiple_image_selector.dart';
import 'package:venty/ventywidgets/searchField.dart';
import 'package:venty/ventywidgets/timePickerField.dart';
import 'package:youtube_player/youtube_player.dart';

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

  _setEvent() async {
    var event = bloc.setEvent();
    if (event != null) {
      var res = await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AddDescriptionView(
          bloc: DescriptionBloc(event: event),
        );
      }));
      if(res==true){
        Navigator.pop(context);
      }
    }
  }

  Widget _buildLoadingWidget() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.black87),
        child: Center(
            child: SizedBox(
          width: 60.0,
          height: 60.0,
          child: Theme(
            data: ThemeData(primarySwatch: Colors.red),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 3.0,
            ),
          ),
        )));
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
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
                        VentyColors.conseptRed,
                        VentyColors.conseptPurple
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
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0.0),
                                                errorText: snapshot.error,
                                                errorStyle:
                                                    TextStyles.errorTextHeader),
                                            style:
                                                TextStyles.tileHeaderTextWhite);
                                      }),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                StreamBuilder<LocationModel>(
                                    stream: bloc.location,
                                    builder: (context, snapshot) {
                                      return Row(
                                        children: <Widget>[
                                          snapshot.data == null
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
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                ),
                                          snapshot.hasError
                                              ? Text(
                                                  snapshot.error,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                )
                                              : SizedBox()
                                        ],
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
          MaterialTile(
            child: Column(children: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                title: Text('Event date and time',
                    style: TextStyles.listTileHeader),
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
          StreamBuilder<bool>(
              stream: bloc.switchstream,
              builder: (context, snapshot) {
                return MaterialTile(
                  child: Column(children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Price', style: TextStyles.listTileHeader),
                          Switch(
                            value: snapshot.hasData ? snapshot.data : false,
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: snapshot.data == true
                            ? TextField(
                                onChanged: bloc.priceValue,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: "Input ticket price",
                                    border: InputBorder.none),
                                style: TextStyles.listTileSubtitle,
                              )
                            : Text('Switch toggle to change free/paid',
                                style: TextStyles.tileSubtitleTextDark),
                      ),
                    )
                  ]),
                );
              }),
          StreamBuilder<List<File>>(
              stream: bloc.images,
              builder: (context, snapshot) {
                return MaterialTile(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Select photo",
                            style: TextStyles.listTileHeader),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MultipleImageSelector(
                          onChanged: bloc.imagesValue,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      ))
                    ],
                  ),
                );
              }),
          StreamBuilder<bool>(
              stream: bloc.switchvideostream,
              builder: (context, snapshot) {
                return MaterialTile(
                  child: Column(children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('YouTube', style: TextStyles.listTileHeader),
                          Switch(
                            value: snapshot.hasData ? snapshot.data : false,
                            onChanged: bloc.switchvideoValue,
                            activeColor: Colors.white,
                            activeTrackColor: VentyColors.primaryRed,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: snapshot.data == true
                          ? StreamBuilder<String>(
                              stream: bloc.linkvideostream,
                              builder: (context, snapshot) {
                                return Column(children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.video_call,
                                        color: VentyColors.primaryRed),
                                    title: TextField(
                                        onChanged: bloc.linkvideoValue,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            hintText: "Enter video link",
                                            errorText: snapshot.error,
                                            border: InputBorder.none),
                                        style: TextStyles.listTileSubtitle),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 10.0),
                                    child: Material(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        elevation: 4.0,
                                        child: snapshot.hasData &&
                                                !snapshot.hasError
                                            ? YoutubePlayer(
                                                onError: bloc.linkVideoError,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                                autoPlay: false,
                                                showVideoProgressbar: false,
                                                context: context,
                                                source: snapshot.data,
                                                quality: YoutubeQuality.HD,
                                              )
                                            : SizedBox()),
                                  )
                                ]);
                              })
                          : ListTile(
                              leading: Icon(Icons.video_call,
                                  color: VentyColors.primaryRed),
                              title: Text('Switch toggle to show video',
                                  style: TextStyles.tileSubtitleTextDark),
                            ),
                    ),
                  ]),
                );
              }),
          StreamBuilder<Category>(
              stream: bloc.category,
              builder: (context, snapshot) {
                return MaterialTile(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        title: Text(
                          "Category",
                          style: TextStyles.listTileHeader,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.category,
                          color: VentyColors.primaryRed,
                        ),
                        title: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: snapshot.hasData
                              ? Text(
                                  "${snapshot.data?.categoryName ?? "Choose category"}",
                                  style: TextStyles.listTileSubtitle,
                                )
                              : Text(
                                  "Choose category",
                                  style: TextStyles.listTileSubtitle,
                                ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SearchCategoryDialog(
                                        onItemSelected: bloc.categoryChanged));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
          MaterialTile(
            child: Column(children: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                title: Text(
                  'Submit event?',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Poppins',
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
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600)),
                        width: 140,
                        gradient: new LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 79, 85, 1),
                            Color.fromRGBO(148, 39, 41, 1)
                          ],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft,
                        ),
                        onPressed: _setEvent,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          width: 150,
                          height: 50,
                          child: FlatButton(
                            child: Text('No',
                                style: TextStyle(
                                    color: VentyColors.primaryDark,
                                    fontSize: 20,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600)),
                            onPressed: () {
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
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Center(
        child: Text("$error", style: TextStyles.errorTextMain),
      ),
    );
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
        child: StreamBuilder<bool>(
            stream: bloc.isLoading,
            builder: (context, snapshot) {
              return Scaffold(
                  appBar: snapshot.data == true
                      ? AppBar()
                      : AppBar(
                          centerTitle: true,
                          actions: <Widget>[
                            IconButton(
                              icon: Icon(Icons.done,
                                  color: VentyColors.primaryDark),
                              onPressed: () {
                                _setEvent();
                              },
                            ),
                          ],
                          title: Text("Create event",
                              style: TextStyle(color: VentyColors.primaryDark)),
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: VentyColors.primaryDark),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                  body: snapshot.data == true
                      ? _buildLoadingWidget()
                      : StreamBuilder<String>(
                          stream: bloc.error,
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? _buildErrorWidget(snapshot.data)
                                : _buildBodyContent();
                          }));
            }));
  }
}
