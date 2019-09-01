import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';
import 'pages/loginview/loginview.dart';
import 'pages/loginview/registerview.dart';
import 'package:flutter/services.dart';



void main() => runApp(Venty());

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}


class Venty extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      home: LoginView(),
      routes: <String, WidgetBuilder>{
        '/register' : (BuildContext context) => new RegisterView(),
        '/login' : (BuildContext context) => new LoginView()
      }
    );
  }
}

