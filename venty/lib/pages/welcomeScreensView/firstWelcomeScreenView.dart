import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:venty/main.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/carouselDotsSlider.dart';

class FirstWelcomeScreenView extends StatefulWidget {
  @override
  _FirstWelcomeScreenViewState createState() => _FirstWelcomeScreenViewState();
}

class _FirstWelcomeScreenViewState extends State<FirstWelcomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Image(
                        image: AssetImage('images/VLogo_blue.png'),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: CarouselWithDots(
                      items: [
                        Image.asset('images/VSplash_humans.png'),
                        Image.asset('images/VSplash_humans.png'),
                        Image.asset('images/VSplash_humans.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClippers.clippers[1],
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                color: VentyColors.conseptDark,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClippers.clippers[0],
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                color: VentyColors.conseptPurple,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Find Your Company",
                          style: TextStyles.whiteH1WelcomeText,
                        ),
                        Text(
                          "Just choise an event and find your company \n among the participants",
                          textAlign: TextAlign.center,
                          style: TextStyles.whiteH2WelcomeText,
                        ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                                              child: Align(
                        alignment: Alignment.bottomRight,
                                              child: ClipRRect(
                          borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          child: ButtonTheme(
                            buttonColor: Colors.white,
                                             minWidth: 120,
                                             height: 50,         child: RaisedButton(
                              
                              child: Text("Next",style: TextStyles.smallItemTextDark2,),
                              onPressed: () {},
                            ),
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
          ),
        ],
      ),
    );
  }
}

class WaveClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 110);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 50);
    path.quadraticBezierTo(size.width / 2, 0, 0, 110);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 200);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}

class WaveClippers {
  static List<CustomClipper<Path>> clippers = [
    WaveClipperOne(),
    WaveClipperTwo()
  ];
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.55, size.height * 0.68, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}
