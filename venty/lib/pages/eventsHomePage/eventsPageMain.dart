import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:venty/ventywidgets/drawer.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int index;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _onChange(int) {
    setIndex(int);
  }

  setIndex(int) {
    setState(() {
      index = int;
    });
  }

  Widget _buildItem() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: PhotosCarousel(),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 15,
                      MediaQuery.of(context).size.height / 3,
                      0,
                      0),
                  child: Text(
                    "TOMMOROWLAND",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 15,
                      MediaQuery.of(context).size.height / 2.6,
                      0,
                      0),
                  child: Text(
                    'Belgium, 24 April',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  )),
            ],
          ),
          CustomListTitle1(
              Icons.calendar_today, 'When: ', '24 April', () => {}),
          CustomListTitle1(Icons.place, 'Where: ', 'Belgium', () => {}),
          CustomListTitle1(Icons.access_time, 'Time: ', '9 am', () => {}),
          CustomListTitle1(Icons.monetization_on, 'Price: ', '100', () => {}),
          CustomListTitle1(Icons.group, 'Members: ', '25000', () => {}),
          CustomListTitle1(Icons.category, 'Category: ', 'Music', () => {}),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerView(),
      body: Stack(
        children: <Widget>[
          CarouselSlider(
            viewportFraction: 1.0,
            height: MediaQuery.of(context).size.height,
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            items: <Widget>[_buildItem(), _buildItem()],
            onPageChanged: _onChange,
          ),
          SizedBox(
            height: 80,
                      child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTitle1 extends StatelessWidget {
  final IconData icon;
  final String text;
  final String text1;
  final Function onTap;
  CustomListTitle1(this.icon, this.text, this.text1, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 35,
          MediaQuery.of(context).size.width / 75,
          MediaQuery.of(context).size.width / 35,
          0.0),
      child: InkWell(
        splashColor: Colors.deepPurple,
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height / 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width / 35, 0.0, 0.0, 0.0),
                    child: Icon(
                      icon,
                      color: Color.fromRGBO(127, 127, 127, 8.0),
                      size: 17.0,
                    )),
              ),
              //Icon(Icons.arrow_right)
              Container(
                width: 80,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 20, 0.0, 0.0, 0.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(127, 127, 127, 8.0)),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 35, 0.0, 0.0, 0.0),
                  child: Text(text1,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Poppins',
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotosCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: new Material(
          elevation: 16.0,
          child: Stack(
            children: <Widget>[
              new Carousel(
                
                dotSize: 5.0,
                overlayShadow: true,
                overlayShadowSize: 1.0,
                overlayShadowColors: Colors.black.withOpacity(0.5),
                dotSpacing: 13.0,
                dotBgColor: Colors.black.withOpacity(0.0),
                autoplay: false,
                images: [
                  new NetworkImage(
                      'https://cdn.assets.tomorrowland.com/2019/live/og2.jpg'),
                  new NetworkImage(
                      'https://www.tomorrowland.com/src/Frontend/Themes/tomorrowland/Core/Layout/images/timeline/2018-1.jpg'),
                  new NetworkImage(
                      'https://www.visitflanders.com/en/binaries/45b1b488-84d1-47ed-a063-4484b5922992_tcm13-132651.jpg'),
                ],
              ),
            ],
          )),
    );
  }
}
