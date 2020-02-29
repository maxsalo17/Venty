import 'package:flutter/material.dart';
import 'package:venty/bloc/eventsBloc.dart';
import 'package:venty/pages/addDescriptionView/addDescription.dart';
import 'package:venty/pages/addEventView/addEventView.dart';
import 'package:venty/pages/eventsHomePage/eventsPageMain.dart';
import 'package:venty/pages/mainScreenWrapper/mainScreenWrapper.dart';
import 'package:venty/pages/profileview/profileview.dart';
import 'package:venty/pages/welcomeScreensView/firstWelcomeScreenView.dart';
import 'package:venty/tools/theme.dart';
import 'pages/eventListView/eventListView.dart';
import 'pages/eventsFeedView/eventsFeedView.dart';
import 'pages/loginview/loginview.dart';
import 'pages/loginview/registerview.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Venty());
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class Venty extends StatefulWidget {
  @override
  _VentyState createState() => _VentyState();
}

class _VentyState extends State<Venty> {
  // This widget is the root of your application.
  EventsBloc bloc = EventsBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return MaterialApp(
      home: FirstWelcomeScreenView(),
      // home : MainScreenWrapper(bloc: bloc,),
         debugShowCheckedModeBanner: false,
        // home: MainScreenWrapper(bloc: bloc,),
        // home: EventsFeedView(
        //   bloc: bloc,
        // ),
        routes: <String, WidgetBuilder>{
          '/register': (BuildContext context) => new RegisterView(),
          '/login': (BuildContext context) => new LoginView(),
          '/create-event': (BuildContext context) => new AddEventView(),
          '/profile': (BuildContext context) => new ProfileView(),
          '/home': (BuildContext context) => new EventsFeedView(
                bloc: bloc,
              ),
          '/eventslist': (BuildContext context) => new EventsList(),
        });
  }
}
