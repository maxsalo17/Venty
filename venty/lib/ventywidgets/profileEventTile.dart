import 'package:flutter/material.dart';
import 'package:venty/models/eventModel.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/materialTile.dart';
import 'package:venty/ventywidgets/roundedImage.dart';

class ProfileEventTile extends StatelessWidget {
  final EventModel event;
  final bool isNetwork;
  final Function onPressed;
  ProfileEventTile({this.event, this.isNetwork = true, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialTile(
      padding: EdgeInsets.symmetric(vertical: 8.0),
        borderRadius: 30.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed ?? (){},
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: RoundedImage(
                          isNetwork: isNetwork,
                          asset: event?.avatar ?? "",
                        )),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(event.name??"",style: TextStyles.tileH1Text,),
                      )
                  ],
                ),
                IconButton(icon: Icon(Icons.more_vert, color: VentyColors.primaryDark,),onPressed: (){},)
              ],
            ),
          ),
        ));
  }
}
