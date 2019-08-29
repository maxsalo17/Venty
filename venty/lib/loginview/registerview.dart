import 'package:flutter/material.dart';
import 'package:venty/ventywidgets/textfield.dart';

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
                      highlightElevation: 0,
                      
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
                  Container(
                    height: 40,
                    child: new Image(
                      image: new AssetImage("images/VentyMainLogo.png"),
                      
                    ),
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
                      child: VentyTextField(hintText: 'Login', isPassword: false, )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: VentyTextField(hintText: 'Password', isPassword: true,)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: VentyTextField(hintText: 'Confirm Password', isPassword: true,)),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 20.0),
                      child: VentyTextField(hintText: 'E-Mail', isPassword: false,)),
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
                                Color.fromRGBO(255, 79, 85, 1),
                                        Color.fromRGBO(148, 39, 41, 1)
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
