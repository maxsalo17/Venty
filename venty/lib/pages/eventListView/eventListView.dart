import 'package:flutter/material.dart';
import 'package:venty/bloc/eventsBloc.dart';
import 'package:venty/models/eventModel.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/searchBar.dart';

class EventsList extends StatelessWidget {
  EventsBloc bloc;
  EventsList({this.bloc});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: StreamBuilder<List<EventModel>>(
          stream: bloc.events,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Stack(
                  children: <Widget>[
                    ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Column(
                                children: [SizedBox(
                                  height: 70,
                                ), ...snapshot.data
                                    .map((e) => CardData(
                                          image: e.avatar,
                                          name: e.name,
                                          place: e.location.address,
                                          price: e.price,
                                          isActive: e.isFollowed,
                                        ))
                                    .toList(),
                                    SizedBox(
                                  height: 70,
                                )]),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SearchBar(),
                        ))
                  ],
                )
                : SizedBox();
          }),
    );
  }
}

// class CardData extends StatelessWidget {
//   String image1;
//   String name;
//   String date;
//   String place;
//   String price;
//   CardData(this.image1,this.name,this.date,this.place,this.price);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 130.0,
//     child : Card(
//       child: Stack(
//         children: <Widget>[
//           ListTile(
//             leading: Container( width:80, height: 80, child: CircleAvatar(backgroundImage: AssetImage(image1),)) ,
//             title: Text(
//               'Tomorrowland',
//               style: TextStyle(fontFamily: "Poppins", color: Colors.grey,fontSize: 18),
//             ),
//             subtitle: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Container(
//                    width: 70,
//                    child :Text('Date',style: TextStyle(fontFamily:'Poppins'))
//                    ),

//                    Container(
//                    width: 80,
//                    child :Text('Place',style: TextStyle(fontFamily:'Poppins'))
//                    ),

//                    Container(
//                    width: 70,
//                    child :Text('Price',style: TextStyle(fontFamily:'Poppins'))
//                    ),

//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                     Container(
//                    width: 70.0,
//                    child : Text(date,style: TextStyle(fontFamily: 'Poppins',fontSize: 12))
//                    ),

//                    Container(
//                    width: 80.0,
//                    child :Text(place,style: TextStyle(fontFamily:'Poppins',fontSize: 12))
//                    ),

//                    Container(
//                    alignment: Alignment.topLeft,
//                    width: 70.0,
//                    child :Text(price,style: TextStyle(fontFamily:'Poppins',fontSize: 12))
//                    ),
//                  ],
//                ),
//              ],
//             ),
//           ),
//         ],
//       ),
//     ),
//     );
//   }
// }
class CardData extends StatelessWidget {
  String image;
  String name;
  String date;
  String place;
  String price;
  bool isActive = false;
  CardData(
      {this.image,
      this.name,
      this.date,
      this.place,
      this.price,
      this.isActive});
  IconData activityIcon(bool isActive) {
    if (isActive) {
      return Icons.flag;
    } else
      return Icons.outlined_flag;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 9.0,
        child: Container(
          height: 160.0,
          child: InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Card(
                margin: EdgeInsets.all(0.0),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      new DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.5)
                            ])),
                      ),
                      Positioned(
                        bottom: 15.0,
                        left: 15.0,
                        child: new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                name,
                                style: new TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.0),
                              ),
                              new Text(
                                "$date, $place",
                                style: new TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0),
                              ),
                              new Text(
                                "Price: $price",
                                style: new TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10.0,
                          right: 10.0,
                          child: ActivityButton(isActive==true))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityButtonState extends State<ActivityButton> {
  bool _isActive;

  ActivityButtonState(this._isActive);
  setActivity() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isActive ? Icons.flag : Icons.outlined_flag,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () => setActivity(),
    );
  }
}

class ActivityButton extends StatefulWidget {
  bool _isActive;

  ActivityButton(this._isActive);
  @override
  ActivityButtonState createState() => ActivityButtonState(_isActive);
}
//    CardData(Image.asset('party1.jpg',),'Tomorrowland','2019-05-20 19:00','Kyiv, Lomonosova,35','50'),

// Container(
//       height: MediaQuery.of(context).size.height * 0.5,
//       child: new Material(
//           elevation: 16.0,
//           child: Stack(
//             children: <Widget>[
//               new Carousel(

//                 dotSize: 5.0,
//                 overlayShadow: true,
//                 overlayShadowSize: 1.0,
//                 overlayShadowColors: Colors.black.withOpacity(0.5),
//                 dotSpacing: 13.0,
//                 dotBgColor: Colors.black.withOpacity(0.0),
//                 autoplay: false,
//                 images: [
//                   new NetworkImage(
//                       'https://cdn.assets.tomorrowland.com/2019/live/og2.jpg'),
//                   new NetworkImage(
//                       'https://www.tomorrowland.com/src/Frontend/Themes/tomorrowland/Core/Layout/images/timeline/2018-1.jpg'),
//                   new NetworkImage(
//                       'https://www.visitflanders.com/en/binaries/45b1b488-84d1-47ed-a063-4484b5922992_tcm13-132651.jpg'),
//                 ],
//               ),
//             ],
//           )),
//     );
