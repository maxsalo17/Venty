import 'package:flutter/material.dart';
import 'package:venty/ventywidgets/customListTitle.dart';

class DrawerView extends StatefulWidget {
  Function onSelect;

  DrawerView({this.onSelect});
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.deepPurple,
                  Colors.purpleAccent
                ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 12.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    child: Image.network(
                            'https://s11.stc.all.kpcdn.net/share/i/12/10651777/inx960x640.jpg',
                           fit: BoxFit.cover,
                          ),
                                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Andrew_McTraher',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                )),
            CustomListTitle(Icons.person, 'Account', () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
              
            }),
            CustomListTitle(Icons.event, 'Events list', () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/eventslist');
            }),
            CustomListTitle(Icons.group, 'Friends', () => {}),
            CustomListTitle(Icons.settings, 'Settings', () => {}),
            CustomListTitle(Icons.calendar_today, 'Calendar', () => {}),
            CustomListTitle(Icons.help, 'Help', () => {}),
          ],
        ),
      );
  }
}