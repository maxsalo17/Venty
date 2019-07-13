import 'package:flutter/material.dart';
import 'package:fango/tools/tools.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: new Scaffold(
          resizeToAvoidBottomInset: false,
          body: new Container(
              width: double.infinity,
              
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/Background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  new Image(
                    image: new AssetImage("images/FangoLogo.png"),
                    width: MediaQuery.of(context).size.width*0.4,
                  ),
                  new SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: new TextField(
                        decoration: new InputDecoration(
                            labelText: "Login or E-Mail",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(180, 103, 107, 115),
                                fontFamily: "Segoe UI",
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                            contentPadding:
                                const EdgeInsets.only(left: 2.0, bottom: 4.0),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(180, 103, 107, 115),
                            ))),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 20.0),
                      child: new TextField(
                        obscureText: true,
                        decoration: new InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(180, 103, 107, 115),
                                fontFamily: "Segoe UI",
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                            contentPadding:
                                const EdgeInsets.only(left: 2.0, bottom: 4.0),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 1.5,
                                    color:
                                        Color.fromARGB(180, 103, 107, 115)))),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 0.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(720),
                          child: new FlatButton(
                              child: new Text("Forgot password?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(106, 0, 150, 1),
                                      fontSize: 14,
                                      fontFamily: "Segoe UI",
                                      fontWeight: FontWeight.w200)),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                  new SizedBox(height: 10.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right:5 ),
                        child: new ClipRRect(
                          borderRadius: BorderRadius.circular(180),
                          child: new Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height*0.06,
                            decoration: new BoxDecoration(
                              gradient: new LinearGradient(
                                colors: [
                                  Color.fromRGBO(106, 0, 150, 1),
                                  Color.fromRGBO(160, 0, 220, 1)
                                ],
                                begin: FractionalOffset.centerRight,
                                end: FractionalOffset.centerLeft,
                              ),
                            ),
                            child: new FlatButton(
                                child: new Text('LOGIN',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w200)),
                                onPressed: () {
                                  print('Clicked');
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0 , left: 5.0),
                        child: new ClipRRect(
                          borderRadius: BorderRadius.circular(180),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height:MediaQuery.of(context).size.height*0.06 ,
                            child: new FlatButton(
                                child: Text("SIGN UP",
                                    style: TextStyle(
                                        color: Color.fromRGBO(49, 40, 56, 1),
                                        fontSize: 16,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.normal)),
                                onPressed: () => Navigator.of(context)
                                    .pushNamed('/register')),
                          ),
                        ),
                      )
                    ],
                  ),
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.10,
                  ),
                  new Container(
                    
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text("LOGIN WITH",
                              style: TextStyle(
                                  color: Color.fromARGB(230, 230, 230, 230),
                                  fontSize: 16,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w200)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: new ClipRRect(
                                borderRadius: BorderRadius.circular(360),
                                child: Material(
                                  elevation: 4.0,
                                  shape: CircleBorder(),
                                  color: Colors.transparent,
                                  child: Ink.image(
                                    image: AssetImage('images/GoogleButton.png'),
                                    fit: BoxFit.cover,
                                    width: new Limiter().minMaxLimit(MediaQuery.of(context).size.width*0.15, 40.0, 70.0),
                                    height: new Limiter().minMaxLimit(MediaQuery.of(context).size.width*0.15, 40.0, 70.0), //new Percent(context).fromPersentHeightMax(0.1, 60),
                                    child: InkWell(
                                      onTap: () {},
                                      child: null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: new ClipRRect(
                                borderRadius: BorderRadius.circular(360),
                                child: Material(
                                  elevation: 4.0,
                                  shape: CircleBorder(),
                                  color: Colors.transparent,
                                  child: Ink.image(
                                    image:
                                        AssetImage('images/FacebookButton.png'),
                                    fit: BoxFit.cover,
                                    width: new Limiter().minMaxLimit(MediaQuery.of(context).size.width*0.15, 40.0, 70.0),
                                    height: new Limiter().minMaxLimit(MediaQuery.of(context).size.width*0.15, 40.0, 70.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: null,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
