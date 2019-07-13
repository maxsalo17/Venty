import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  void dodo() {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        
        home: new Scaffold(
          floatingActionButton:  new Container(
            padding: EdgeInsets.only(top: 110.0),
            child: new FloatingActionButton(
                      child: Icon(Icons.arrow_back),
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      foregroundColor: Color.fromRGBO(49, 40, 56, 0.8),
                      
                      onPressed: () => Navigator.of(context).pushNamed('/login'),
                    ),
          ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          
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
                children: <Widget>[
                  new SizedBox(
                    height: 40.0,
                  ),
                  new Image(
                    image: new AssetImage("images/FangoLogo.png"),
                    width: 100.0,
                  ),
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  new Text(
                    "SIGN UP!",
                    style: new TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: Color.fromRGBO(49, 40, 56, 0.8)),
                  ),
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: new TextField(
                        decoration: new InputDecoration(
                            labelText: "Login",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
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
                              color: Color.fromARGB(180, 103, 107, 115),
                            ))),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: new TextField(
                        obscureText: true,
                        decoration: new InputDecoration(
                            labelText: "Confirm password",
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            labelText: "E-Mail",
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
                  new SizedBox(height: 40.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: new Container(
                          width: 160.0,
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
                              child: new Text('SIGN UP',
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
                    ],
                  ),
                  
                 
                ],
              )),
        ));
  }
}
