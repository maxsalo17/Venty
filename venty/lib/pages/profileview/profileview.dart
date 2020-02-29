import 'package:flutter/material.dart';
import 'package:venty/pages/addEventView/addEventView.dart';
import 'package:venty/ventywidgets/appBar.dart';
import 'package:venty/models/eventModel.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/carousel_slider.dart';
import 'package:venty/ventywidgets/categoryButton.dart';
import 'package:venty/ventywidgets/drawer.dart';
import 'package:venty/ventywidgets/profileEventTile.dart';
import 'package:venty/ventywidgets/roundedImage.dart';
import 'package:venty/ventywidgets/ventywidgets.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<CategoryButton> categories = [
    CategoryButton(
      text: "Music",
      onPressed: () {},
    ),
    CategoryButton(
      text: "Entertainment",
      onPressed: () {},
    ),
    CategoryButton(
      text: "EDM",
      onPressed: () {},
    ),
    CategoryButton(
      text: "Food",
      onPressed: () {},
    ),
  ];

  List<EventModel> events = [
    EventModel(
        avatar:
            "https://cdn.dribbble.com/users/3703000/screenshots/6733905/drb_outrun_2c_2x.jpg",
        name: "Cyberpunk Fun Meeting"),
    EventModel(
        avatar:
            "https://cdn2.lamag.com/wp-content/uploads/sites/6/2019/04/maple-block-food-bowl.jpg",
        name: "Eatme Food Festival"),
    EventModel(
        avatar:
            "https://cdn25.img.ria.ru/images/150157/80/1501578083_0:0:3500:2396_600x600_80_0_1_c27dd604b44966b6882af3c89afd58e0.jpg",
        name: "Burning Man 2020"),
    EventModel(
        avatar:
            "https://cdn.dribbble.com/users/3703000/screenshots/6733905/drb_outrun_2c_2x.jpg",
        name: "Cyberpunk Fun Meeting"),
    EventModel(
        avatar:
            "https://cdn2.lamag.com/wp-content/uploads/sites/6/2019/04/maple-block-food-bowl.jpg",
        name: "Eatme Food Festival"),
    EventModel(
        avatar:
            "https://cdn25.img.ria.ru/images/150157/80/1501578083_0:0:3500:2396_600x600_80_0_1_c27dd604b44966b6882af3c89afd58e0.jpg",
        name: "Burning Man 2020"),
    EventModel(
        avatar:
            "https://cdn.dribbble.com/users/3703000/screenshots/6733905/drb_outrun_2c_2x.jpg",
        name: "Cyberpunk Fun Meeting"),
    EventModel(
        avatar:
            "https://cdn2.lamag.com/wp-content/uploads/sites/6/2019/04/maple-block-food-bowl.jpg",
        name: "Eatme Food Festival"),
    EventModel(
        avatar:
            "https://cdn25.img.ria.ru/images/150157/80/1501578083_0:0:3500:2396_600x600_80_0_1_c27dd604b44966b6882af3c89afd58e0.jpg",
        name: "Burning Man 2020")
  ];

  Widget _buildTileWithShadow({child, borderRadius}) {
    return Material(
      shadowColor: VentyColors.conseptDark.withOpacity(0.3),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzAiQu6W5puFkwQmrkgCgAps4M91ZKWsUm_NJ_bVWKJ1Z4Aclh&s",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Theme(
              data: ThemeData(accentColor: Colors.transparent),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        print("Tapped");
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height * 0.45) - 50,
                        child: Stack(
                          children: <Widget>[
                            IgnorePointer(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _buildTileWithShadow(
                        borderRadius: 50.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Andrew Marenich",
                                      style: TextStyles.profileTextHeaderDark),
                                      IconButton(icon: Icon(Icons.add),onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEventView()));
                                      },)
                                ],
                              ),
                              Text("Ukraine, Kyiv",
                                  style: TextStyles.primaryDarkH2Text),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 35.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text("75",
                                            style: TextStyles
                                                .profileFollowersText),
                                        Text("Followers",
                                            style: TextStyles.darkH2Text),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text("255",
                                            style: TextStyles
                                                .profileFollowersText),
                                        Text("Following",
                                            style: TextStyles.darkH2Text),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                  "25 year old - i am fucking bitch, and i want to get some incredible skills in flutter or show you my cool app that has been created by me and Max. ",
                                  style: TextStyles.profileDarkH2Text),
                              SizedBox(height: 20),
                              Text("Preffered categories",
                                  style: TextStyles.profileDarkH2Text),
                              SizedBox(height: 20),
                              Wrap(
                                children: categories
                                    .map((c) => Padding(
                                          padding: EdgeInsets.all(4),
                                          child: c,
                                        ))
                                    .toList(),
                              ),
                              SizedBox(height: 20),
                              Text("Events",
                                  style: TextStyles.profileH2DarkText),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: events
                                    .map((e) => ProfileEventTile(event: e))
                                    .toList(),
                              ),
                              SizedBox(height: 60.0,)
                            ],
                          ),
                        )),
                        
                  ],
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: VentyAppBar(title: "Andrew Marenich",),
          // )
        ],
      ),
    );
  }
}
