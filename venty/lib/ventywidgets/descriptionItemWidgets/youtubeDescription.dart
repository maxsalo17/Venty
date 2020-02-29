import 'package:flutter/material.dart';
import 'package:venty/models/descriptionBase.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/materialTile.dart';

class YoutubeDescriptionWidget extends StatefulWidget {
  final YoutubeDescription link;
  final int index;
  final Function(int, YoutubeDescription) onChanged;
  YoutubeDescriptionWidget({Key key, this.link, this.index, this.onChanged}) : super(key: key);

  @override
  _YoutubeDescriptionWidgetState createState() => _YoutubeDescriptionWidgetState();
}

class _YoutubeDescriptionWidgetState extends State<YoutubeDescriptionWidget> {

  @override
  Widget build(BuildContext context) {
    return 
    MaterialTile(
      padding: EdgeInsets.all(0.0),
      borderRadius: 8.0,
      child: 
    Container(
       child:  Padding(
         padding: EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("YouTube video",style: TextStyles.greyH2Text),
            TextField(
              onChanged: (text) {
                widget.onChanged(widget.index, YoutubeDescription(youtubeLink: text));
              },
              decoration: InputDecoration(
                hintText: "Paste YouTube video link",
              ),
            )
          ],
      ),
       ),
    ),
    );
  }
}