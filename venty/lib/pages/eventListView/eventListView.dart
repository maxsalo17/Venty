import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

class EventsList extends StatelessWidget {
  List<Widget> initializeCards() {
    List<CardData> _events = new List<CardData>();
    _events = new List<CardData>();
    _events.add(CardData(
        'https://cdn.pixabay.com/photo/2017/07/21/23/57/concert-2527495__340.jpg',
        'Tomorrowland',
        '22/05/19 22:00',
        'Lomonosova 35, Kyiv',
        '50',
        true));
    _events.add(CardData(
        'http://www.realdetroitweekly.com/wp-content/uploads/2016/12/3D-Party.jpg',
        'Tomorrowland',
        '22/05/19 22:00',
        'Lomonosova 35, Kyiv',
        '50',
        false));
    _events.add(CardData(
        'https://images.france.fr/zeaejvyq9bhj/5eVMkUHWNqgUiCAsOEISMw/2509ed243424cd01760c33e8b4f1e502/Tomorrowland_Belgium_2017_redimensionn__e.jpg?w=1120&h=490&q=70&fl=progressive&fit=fill',
        'Tomorrowland',
        '22/05/19 22:00',
        'Lomonosova 35, Kyiv',
        '50',
        true));
    _events.add(CardData(
        'https://dancingastronaut.com/wp-content/uploads/2019/02/Tomorrowland-Mainstage-2018.jpg',
        'Tomorrowland',
        '22/05/19 22:00',
        'Lomonosova 35, Kyiv',
        '50',
        false));
    _events.add(CardData(
        'https://www.visitflanders.com/ru/binaries/45b1b488-84d1-47ed-a063-4484b5922992_tcm39-132651.jpg',
        'Tomorrowland',
        '22/05/19 22:00',
        'Lomonosova 35, Kyiv',
        '50',
        false));

    return _events;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(children: initializeCards()),
          ),
        ],
      ),
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
//               style: TextStyle(fontFamily: "Segoe UI", color: Colors.grey,fontSize: 18),
//             ),
//             subtitle: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Container(
//                    width: 70,
//                    child :Text('Date',style: TextStyle(fontFamily:'Segoe UI'))
//                    ),

//                    Container(
//                    width: 80,
//                    child :Text('Place',style: TextStyle(fontFamily:'Segoe UI'))
//                    ),

//                    Container(
//                    width: 70,
//                    child :Text('Price',style: TextStyle(fontFamily:'Segoe UI'))
//                    ),

//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                     Container(
//                    width: 70.0,
//                    child : Text(date,style: TextStyle(fontFamily: 'Segoe UI',fontSize: 12))
//                    ),

//                    Container(
//                    width: 80.0,
//                    child :Text(place,style: TextStyle(fontFamily:'Segoe UI',fontSize: 12))
//                    ),

//                    Container(
//                    alignment: Alignment.topLeft,
//                    width: 70.0,
//                    child :Text(price,style: TextStyle(fontFamily:'Segoe UI',fontSize: 12))
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
  String image1;
  String name;
  String date;
  String place;
  String price;
  bool isActive = false;
  CardData(
      this.image1, this.name, this.date, this.place, this.price, this.isActive);
  IconData activityIcon(bool isActive) {
    if (isActive) {
      return Icons.flag;
    } else
      return Icons.outlined_flag;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
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
                    image1,
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
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0),
                        ),
                        new Text(
                          date + ", " + place,
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0),
                        ),
                        new Text(
                          "Price: " + price,
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontFamily: "Segoe UI",
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
                    child: ActivityButton(isActive))
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