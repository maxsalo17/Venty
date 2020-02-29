import 'package:flutter/material.dart';
import 'package:venty/models/descriptionBase.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/materialTile.dart';

class TextDescriptionWidget extends StatelessWidget {
  final int index;
  final TextDescription textDescription;
  final Function(int, TextDescription) onChanged;
  const TextDescriptionWidget({Key key, this.textDescription, this.index, this.onChanged})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return 
    MaterialTile(
      padding: EdgeInsets.all(0.0),
      borderRadius: 8.0,
    child : Container(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Text description",style: TextStyles.greyH2Text),
            TextField(
              onChanged: (text) {
                onChanged(index, TextDescription(text: text));
              },
              decoration: InputDecoration(
                hintText: "Input plain text description",
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
