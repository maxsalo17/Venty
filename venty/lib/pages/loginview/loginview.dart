import 'package:flutter/material.dart';
import 'package:venty/bloc/authenticationBloc.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/tools/tools.dart';
import 'package:venty/ventywidgets/textfield.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthenticationBloc bloc = AuthenticationBloc();

  bool _isHidden = true;
  bool _isBusy = false;

  _toggleHidden() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  authorize() {
    setBusy(true);
    bloc.autorize(onSuccess: () {
      setBusy(false);
      Navigator.pushReplacementNamed(context, '/profile');
    }, onError: () {
      setBusy(false);
    });
  }

  setBusy(bool) {
    setState(() {
      _isBusy = bool;
    });
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
              child: new Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image(
                          image: new AssetImage("images/VentyMainLogo.png"),
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        new SizedBox(
                          height: 20.0,
                        ),
                        new Form(
                          child: Theme(
                            data: new ThemeData(
                                primaryColor:
                                    VentyColors.primaryRed.withOpacity(0.5),
                                primaryColorDark:
                                    VentyColors.primaryRed.withOpacity(0.5),
                                splashColor: Colors.white70),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0, vertical: 20.0),
                                    child: StreamBuilder<String>(
                                        stream: bloc.email,
                                        builder: (context, snapshot) {
                                          return new VentyTextField(
                                            isPassword: false,
                                            onChanged: bloc.emailValue,
                                            hintText: "E-Mail",
                                            errorText: snapshot.error,
                                          );
                                        })),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 50.0, top: 20.0),
                                    child: StreamBuilder<Object>(
                                        stream: bloc.password,
                                        builder: (context, snapshot) {
                                          return new VentyTextField(
                                              isPassword: true,
                                              onChanged: bloc.passwordValue,
                                              hintText: "Password",
                                              errorText: snapshot.error,);
                                        })),
                              ],
                            ),
                          ),
                        ),
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
                                            color: VentyColors.secondaryRed,
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
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 5),
                              child: new ClipRRect(
                                borderRadius: BorderRadius.circular(180),
                                child: new Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
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
                                  child: Theme(
                                    data: ThemeData(
                                        primaryColor: Colors.grey,
                                        primarySwatch: Colors.grey),
                                    child: new FlatButton(
                                        child: new Text('LOGIN',
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                                fontFamily: "Segoe UI",
                                                fontWeight: FontWeight.w200)),
                                        onPressed: authorize),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, left: 5.0),
                              child: new ClipRRect(
                                borderRadius: BorderRadius.circular(180),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: new FlatButton(
                                      child: Text("SIGN UP",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(49, 40, 56, 1),
                                              fontSize: 14,
                                              fontFamily: "Segoe UI",
                                              fontWeight: FontWeight.normal)),
                                      onPressed: () => Navigator.of(context)
                                          .popAndPushNamed('/register')),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: 20,
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Text("LOGIN WITH",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 230, 230, 230),
                                    fontSize: 17,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w200)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: new ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                  child: Material(
                                    elevation: 4.0,
                                    shape: CircleBorder(),
                                    color: Colors.transparent,
                                    child: Ink.image(
                                      image:
                                          AssetImage('images/GoogleButton.png'),
                                      fit: BoxFit.cover,
                                      width: new Limiter().minMaxLimit(
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                          40.0,
                                          70.0),
                                      height: new Limiter().minMaxLimit(
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                          40.0,
                                          70.0), //new Percent(context).fromPersentHeightMax(0.1, 60),
                                      child: InkWell(
                                        onTap: () {},
                                        child: null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: new ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                  child: Material(
                                    elevation: 4.0,
                                    shape: CircleBorder(),
                                    color: Colors.transparent,
                                    child: Ink.image(
                                      image: AssetImage(
                                          'images/FacebookButton.png'),
                                      fit: BoxFit.cover,
                                      width: new Limiter().minMaxLimit(
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                          40.0,
                                          70.0),
                                      height: new Limiter().minMaxLimit(
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                          40.0,
                                          70.0),
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
                  ),                  
                  StreamBuilder<bool>(
                    stream: bloc.progress,
                    builder: (context, snapshot) {
                      return snapshot.hasData?(snapshot.data? _buildLoadingWidget():SizedBox(height: 0,)):SizedBox(height: 0,);
                    }
                  )
                ],
              )),
        ));
  }

  void signIn() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      //TODO: login to firebase
    }
  }
}
