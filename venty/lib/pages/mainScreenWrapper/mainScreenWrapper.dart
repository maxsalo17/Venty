import 'package:flutter/material.dart';
import 'package:venty/bloc/eventsBloc.dart';
import 'package:venty/pages/addEventView/addEventView.dart';
import 'package:venty/pages/eventListView/eventListView.dart';
import 'package:venty/pages/eventsFeedView/eventsFeedView.dart';
import 'package:venty/pages/profileview/profileview.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/materialTile.dart';

class MainScreenWrapper extends StatefulWidget {
  EventsBloc bloc;
  MainScreenWrapper({this.bloc});
  @override
  _MainScreenWrapperState createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {
  List<Widget> pages;
  List<IconData> navBarItems;

  int currentPage = 0;

  _setPage(int) {
    setState(() {
      currentPage = int;
    });
  }

  @override
  void initState() {
    pages = [
      EventsFeedView(bloc: widget.bloc),
      EventsList(bloc: widget.bloc),
      ProfileView(),
    ];

    navBarItems = [Icons.home, Icons.search, Icons.person];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            pages[currentPage],
            Align(
              alignment: Alignment.bottomCenter,
              child: VentyBottomBar(
                currentInd: currentPage,
                items: navBarItems,
                activeColor: VentyColors.conseptPurple,
                inactiveColor: VentyColors.conseptGrey,
                onPageSelected: _setPage,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VentyBottomBar extends StatelessWidget {
  final List<IconData> items;
  final int currentInd;
  final Color activeColor;
  final Color inactiveColor;
  final Function(int) onPageSelected;
  VentyBottomBar(
      {this.items,
      this.currentInd,
      this.activeColor,
      this.inactiveColor,
      this.onPageSelected});

  List<IconButton> _setItems() {
    List<IconButton> buttons = [];
    for (int i = 0; i < items.length; i++) {
      buttons.add(IconButton(
        icon: Icon(items[i],
            color: i == currentInd ? activeColor : inactiveColor),
        onPressed: () {
          onPageSelected != null ? onPageSelected(i) : () {};
        },
      ));
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: MaterialTile(
          padding: EdgeInsets.all(0),
                  child: Container(
            decoration: BoxDecoration(
                color: VentyColors.smokeWhite,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _setItems(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
