import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/carousel_slider.dart';

class CarouselWithDots extends StatefulWidget {
  double height = 400;
  Color dotBgColor = Colors.black;
  Color dotSlColor = VentyColors.primaryRed;
  bool enlargeCenterPage;
  bool autoPlay;
  bool reverse;
  bool enableInfiniteScroll;
  Duration autoPlayInterval = Duration(seconds: 2);
  Duration autoPlayAnimationDuration = Duration(milliseconds: 2000);
  Duration pauseAutoPlayOnTouch = Duration(milliseconds: 10);
  Axis scrollDirection = Axis.horizontal;
  List<Image> items = [];

  CarouselWithDots({
    this.height,
    this.items,
    this.autoPlay = false,
    this.reverse = false,
    this.enableInfiniteScroll = true,
    this.autoPlayInterval,
    this.dotBgColor,
    this.dotSlColor,
  });

  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  int _current = 0;

  List<T> map<T>(List<Image> list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          height: widget.height,
          initialPage: 0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          items: widget.items,
        ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.items, (index,items) {
            return Container(
            width: 10.0,
            height: 10.0,
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index ? VentyColors.conseptBlue : Colors.black,
            ),
          );
          }
        ),
        ),
      ],
    );
  }
}
