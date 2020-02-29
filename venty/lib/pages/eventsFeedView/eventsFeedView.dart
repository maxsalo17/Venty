import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:venty/api/eventApi.dart';
import 'package:venty/bloc/eventsBloc.dart';
import 'package:venty/main.dart';
import 'package:venty/models/eventModel.dart';
import 'package:venty/models/locationModel.dart';
import 'package:venty/tools/constants.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/carousel_slider.dart';
import 'package:venty/ventywidgets/customSlideExpandablePannel.dart';
import 'package:venty/ventywidgets/drawer.dart';
import 'package:venty/ventywidgets/map.dart';
import 'package:venty/ventywidgets/progressIndicator.dart';

class EventsFeedView extends StatefulWidget {
  EventsBloc bloc;
  EventsFeedView({@required this.bloc});
  @override
  _EventsFeedViewState createState() => _EventsFeedViewState();
}

class _EventsFeedViewState extends State<EventsFeedView> {
  List<EventModel> events = [];

  //Lifecycle Methods

  @override
  void initState() {
    widget.bloc.getEvents();
    super.initState();
  }

  //Build Methods

  List<EventComplexItem> _buildEventItems(List<EventModel> events) {
    return events
        .map((event) => EventComplexItem(
              event: event,
            ))
        .toList();
  }

  Widget _buildLoading() {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: 40,
            height: 40,
            child: VentyProgressIndicator(),
          ),
        )
      ],
    );
  }

  Widget _buildError(String error) {
    return Stack(
      children: <Widget>[
        Center(
          child: Text(
            "$error",
            style: TextStyles.errorTextMain,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<EventModel>>(
          stream: widget.bloc.events,
          builder: (context, snapshot) {
            events = snapshot.data;
            return snapshot.hasData
                ? (snapshot.data.isNotEmpty
                    ? StreamBuilder<int>(
                        stream: widget.bloc.currIndex,
                        builder: (context, snap) {
                          var pin =
                              snapshot.data[snap.data ?? 0]?.location?.location;
                          print(pin.longitude.toString());
                          return Stack(
                            children: <Widget>[
                              Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black.withOpacity(0.1),
                                  child: AnimatedMap(
                                    pin: pin,
                                  )),
                              CarouselSlider(
                                  enableInfiniteScroll: false,
                                  initialPage: 0,
                                  onPageChanged: widget.bloc.onItemChanged,
                                  viewportFraction: 1.0,
                                  height: MediaQuery.of(context).size.height,
                                  aspectRatio:
                                      MediaQuery.of(context).size.aspectRatio,
                                  items: _buildEventItems(snapshot.data)),
                            ],
                          );
                        })
                    : _buildError("Oops! There is no events"))
                : _buildLoading();
          }),
    );
  }
}

class EventComplexItem extends StatefulWidget {
  final EventModel event;

  EventComplexItem({this.event});
  @override
  _EventComplexItemState createState() => _EventComplexItemState();
}

class _EventComplexItemState extends State<EventComplexItem> {
  bool isPanelShown = false;
  PanelController _panelController = PanelController();

  NetworkImage _buildImageItem(String image) {
    return NetworkImage(image);
  }

  List<NetworkImage> _buildImages(List<String> images, {String avatar}) {
    var imageWidgets = List<NetworkImage>();
    if (avatar != null) {
      imageWidgets.add(_buildImageItem(avatar));
    }
    for (String image in images) {
      imageWidgets.add(_buildImageItem(image));
    }
    return imageWidgets;
  }

  _showPanel(bool) {
    setState(() {
      isPanelShown = bool;
    });
  }

  _onDetailButtonPress() {
    if (isPanelShown == true) {
      _panelController.close();
    } else {
      _panelController.open();
    }
  }

  Widget _buildTileWithShadow({child, borderRadius}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        shadowColor: VentyColors.conseptDark.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        elevation: 10.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTileWithShadow(
                borderRadius: 20.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Carousel(
                        dotBgColor: Colors.transparent,
                        overlayShadowColors: Colors.black12,
                        overlayShadow: true,
                        overlayShadowSize: 1,
                        autoplay: false,
                        images: _buildImages(widget.event?.images,
                            avatar: widget.event?.avatar),
                        boxFit: BoxFit.cover,
                        dotSize: 4.0,
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 20,
                      right: 30,
                      child: IgnorePointer(
                        ignoring: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.event?.name ?? "Unnamed",
                              style: TextStyles.tileHeaderTextWhite,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "${widget.event?.location?.address ?? ""}, ${widget.event?.date?.day} ${ConstantTools.getMonthName(widget.event?.date?.month ?? 0)}",
                              style: TextStyles.tileSubtitleTextWhite,
                              maxLines: 1,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        // SlidingUpPanel(
        //   onPanelClosed: () => _showPanel(false),
        //   onPanelOpened: () => _showPanel(true),
        //   minHeight: MediaQuery.of(context).size.height * 0.35,
        //   maxHeight: MediaQuery.of(context).size.height * 0.9,
        //   controller: _panelController,
        //   color: Colors.transparent,
        //   backdropColor: Colors.transparent,
        //   boxShadow: [BoxShadow(color: Colors.transparent)],
        //   panel:
        Positioned(
          bottom: 70,
          left: 10,
          right: 10,
          child: CustomSlideExpandablePannel(
            color: Colors.white,
            expnadDelta: 100,
            minHeight: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: <Widget>[
                      //       // IconButton(
                      //       //   hoverColor: Colors.transparent,
                      //       //   highlightColor: Colors.transparent,
                      //       //   splashColor: Colors.transparent,
                      //       //   icon: Icon(Icons.people,
                      //       //       color: VentyColors.conseptPurple),
                      //       //   onPressed: () {},
                      //       // ),

                      //       // IconButton(
                      //       //   hoverColor: Colors.transparent,
                      //       //   highlightColor: Colors.transparent,
                      //       //   splashColor: Colors.transparent,
                      //       //   icon: Icon(Icons.thumb_up,
                      //       //       color: widget.event.isFollowed == true
                      //       //           ? VentyColors.conseptRed
                      //       //           : VentyColors.conseptGrey),
                      //       //   onPressed: () {
                      //       //     setState(() {
                      //       //       widget.event?.isFollowed =
                      //       //           !(widget.event?.isFollowed ?? false);
                      //       //     });
                      //       //   },
                      //       // )
                      //     ],
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 18.0,
                                    color: VentyColors.secondaryDark,
                                  ),
                                  SizedBox(width: 12.0,),
                                  Expanded(
                                    flex: 1,
                                                                      child: Text(
                                      "${widget.event?.location?.address ?? "Event place is unknown"}",
                                      style: TextStyles.tileH1Text,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today,
                                  size: 18.0, color: VentyColors.secondaryDark),
                                  SizedBox(width: 12.0,),
                            Text(
                                "${widget.event?.date?.day} ${ConstantTools.getMonthName(widget.event?.date?.month)}",
                                style: TextStyles.tileH1Text,
                            ),
                          ],
                        ),
                             ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.monetization_on,
                                  size: 18.0, color: VentyColors.secondaryDark),
                                  SizedBox(width: 12.0,),
                              Text(
                                "${widget.event?.price ?? "Free"}",
                                style: TextStyles.tileH1Text,
                              ),
                            ],
                          ),
                        ),
                          ],
                        ),
                      ),
                     

                      ListTile(
                        title: Text(
                          "Description",
                          style: TextStyles.tileHeaderTextDark,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "${widget.event?.location?.address ?? "Event place is unknown"}",
                          style: TextStyles.tileH1Text,
                        ),
                        leading: Icon(
                          Icons.location_on,
                          color: VentyColors.secondaryDark,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
