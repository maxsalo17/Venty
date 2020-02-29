import 'package:flutter/material.dart';
import 'package:venty/models/descriptionBase.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';
import 'package:venty/ventywidgets/materialTile.dart';

class TextTitledDescriptionWidget extends StatefulWidget {
  final TextTitledDescription content;
  final int index;
  final Function(int, TextTitledDescription) onChanged;
  const TextTitledDescriptionWidget(
      {Key key, this.content, this.index, this.onChanged})
      : super(key: key);
  TextTitledDescriptionState createState() => TextTitledDescriptionState();
}

class TextTitledDescriptionState extends State<TextTitledDescriptionWidget> {
  TextTitledDescription content;

  @override
  void initState() {
    super.initState();
    content = widget.content ?? TextTitledDescription();
  }

  _onChangedTitle(String) {
    setState(() {
      content.title = String;
    });
    widget.onChanged(widget.index, content);
  }

  _onChangedText(String) {
    setState(() {
      content.text = String;
    });
    widget.onChanged(widget.index, content);
  }

  @override
  Widget build(BuildContext context) {
    return 
    MaterialTile(
      padding: EdgeInsets.all(0.0),
    borderRadius: 8.0,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Text description with title",style: TextStyles.greyH2Text),
            TextField(
              onChanged: (text) {
                _onChangedTitle(text);
              },
              decoration: InputDecoration(
                hintText: "Input title",
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (text) {
                _onChangedText(text);
              },
              decoration: InputDecoration(
                hintText: "Input text",
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
