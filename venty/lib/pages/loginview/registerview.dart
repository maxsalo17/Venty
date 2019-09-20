import 'package:flutter/material.dart';
import 'package:venty/bloc/authenticationBloc.dart';
import 'package:venty/ventywidgets/textfield.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}



class _RegisterViewState extends State<RegisterView> {

  AuthenticationBloc bloc = new AuthenticationBloc();


  register(){
    bloc.register(onSuccess: (){}, onError: (){});
  }

  

  Widget _buildLoadingWidget() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.black87),
        child: Center(
            child: SizedBox(width: 60.0, height: 60.0,
                          child: Theme(
                data: ThemeData(primarySwatch: Colors.red),
                            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 3.0,
        ),
              ),
            )));
  }


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
                      
                      onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
                    ),
          ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          
          resizeToAvoidBottomInset: false,
          body: new Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/Background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                
                  Positioned(
                    top:40.0,
                             child: Container(
                               width: MediaQuery.of(context).size.width,
                      height: 40,
                      child:new Text(
                          "SIGN UP!",
                          style: new TextStyle(
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(49, 40, 56, 0.8)),
                        ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0),
                        child: StreamBuilder<String>(
                          stream: bloc.email,
                          builder: (context, snapshot) {
                            return VentyTextField(hintText: 'E-Mail', isPassword: false, onChanged: bloc.emailValue, errorText: snapshot.error);
                          }
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0),
                        child: StreamBuilder<String>(
                          stream: bloc.password,
                          builder: (context, snapshot) {
                            return VentyTextField(hintText: 'Password', isPassword: true, onChanged: bloc.passwordValue,errorText: snapshot.error,);
                          }
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0),
                        child: StreamBuilder<String>(
                          stream: bloc.confirmPassword,
                          builder: (context, snapshot) {
                            return VentyTextField(hintText: 'Confirm Password', isPassword: true,onChanged: bloc.confirmPasswordValue, errorText: snapshot.error,);
                          }
                        )),
                        SizedBox(height: 20,),
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
                              onPressed: register),
                        ),
                      ),
                    ],
                  ),
                      ],
                    ),
                  ),
                  StreamBuilder<bool>(
                    stream: bloc.progress,
                    builder: (context, snapshot) {
                      return snapshot.hasData?(snapshot.data?_buildLoadingWidget():SizedBox(height: 0,)):SizedBox(height: 0,);
                    }
                  )
                ],
              )),
        ));
  }
}
