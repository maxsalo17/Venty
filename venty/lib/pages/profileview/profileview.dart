import 'package:venty/ventywidgets/ventywidgets.dart';
import 'package:flutter/material.dart';
import 'package:venty/ventywidgets/carousel_slider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        home: new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Stack(
        children: <Widget>[
          new Stack(
              children: <Widget>[
                new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(boxShadow: [
                    new BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 15.0)
                  ]),
                  child: new CarouselSlider(
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.easeInOutQuint,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 1700),
                    height: currentHeight * 0.45,
                    items: <Widget>[
                      new Image.network(
                          "https://i.ytimg.com/vi/NTKYDVcfsuc/maxresdefault.jpg",
                          fit: BoxFit.cover,
                          width: currentWidth),
                      new Image.network(
                        "https://www.residentadvisor.net/images/events/flyer/0001/1/es-0101-1124277-front.jpg",
                        fit: BoxFit.cover,
                        width: currentWidth,
                      ),
                      new Image.network(
                        "https://d3vhc53cl8e8km.cloudfront.net/hello-staging/wp-content/uploads/2018/03/08041044/Vy90asbxEd2vBcHlNMDaq3Z7iaEQrkZJaxwPoYU1-972x597.jpeg",
                        fit: BoxFit.cover,
                        width: currentWidth,
                      ),
                      new Image.network(
                        "http://muzonov.net/uploads/posts/2018-04/medium/1524204951_qnu7bea-roc.jpg",
                        fit: BoxFit.cover,
                        width: currentHeight,
                      )
                    ],
                  ),
                ),
                new Container(
                  height: currentHeight * 0.45,
                  width: currentWidth,
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.transparent,
                        Color.fromRGBO(0, 0, 0, 0.8)
                      ])),
                ),
                new Container(
                  height: currentHeight * 0.45,
                  child: new Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 40.0),
                      height: currentWidth * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: new RoundedImage(
                                currentWidth * 0.25,
                                currentWidth * 0.25,
                                new Image.network(
                                        "https://www.mr-online.nl/wp-content/uploads/2017/09/22-sep-Garrix-v2.jpg")
                                    .image),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    "Martin Garrix",
                                    style: new TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                  new Text(
                                    "Amsterdam, Netherlands",
                                    style: new TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17,
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                  new Text(
                                    "21 years old",
                                    style: new TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w200,
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.8)),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                new Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                    child: Ink(
                      
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: CircleBorder(),
                        shadows: [
                          BoxShadow(color: Colors.black, blurRadius: 5.0, offset: Offset(5.0, 5.0))
                        ]
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 30,
                        ),
                        color: Colors.white,
                        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => PopUp()
          );
          // Perform some action
        },
                      ),
                    ),
                  ),
                ),
                new Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.purple,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "8.3m",
                              style: new TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(103, 107, 99, 1)),
                            ),
                            new Text(
                              "Followers",
                              style: new TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: Color.fromRGBO(103, 107, 99, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "37",
                              style: new TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(103, 107, 99, 1)),
                            ),
                            new Text(
                              "Active",
                              style: new TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: Color.fromRGBO(103, 107, 99, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "67",
                              style: new TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(103, 107, 99, 1)),
                            ),
                            new Text(
                              "Visited",
                              style: new TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: Color.fromRGBO(103, 107, 99, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new SizedBox(
      height: 1.0,
      child: Center(
        child: Container(
          height: 0.0,
          margin: EdgeInsetsDirectional.only(start: 40.0, end: 40.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5, color:Color.fromRGBO(58, 59, 66, 10.4) ),
            ),
          ),
        ),
      ),
    ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: new Column(
                children: <Widget>[
                  Container(
                    height: currentHeight*0.35,
                    child: ListView(
                      
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20.0),
                      children: <Widget>[
                        const Text(
                          'About me',
                          style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(58, 59, 66, 0.8)),
                        ),
                        const Text(
                          "Martin Garrix, is a Dutch DJ and record producer from Amstelveen. His most known singles are \"Animals\", \"In the Name of Love\", and \"Scared to be Lonely\". He was ranked number one on DJ Mag's Top 100 DJs list for three consecutive years (2016, 2017, and 2018).He has performed at music festivals such as Coachella, Electric Daisy Carnival, Ultra Music Festival, Tomorrowland, and Creamfields. In 2014 he headlined the 1st edition of Ultra South Africa making this his first major festival. In the same year he became the youngest DJ to headline 2014 Ultra Music Festival at the age of 17. He was a resident DJ at Spain's Hï Ibiza (2017) and Ushuaïa Ibiza (2016 and 2018). He founded the label Stmpd Rcrds in 2016, months after leaving Spinnin' Records and before signing with Sony Music.",
                          style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(123, 128, 140, 1)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
          ],
                )
              ],
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter
            ,
            child: new Icon(Icons.arrow_drop_down)),
        )
        ],
      ),
    ));
  }
}
