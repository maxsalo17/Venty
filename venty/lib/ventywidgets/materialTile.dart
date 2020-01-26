import 'package:flutter/material.dart';

class MaterialTile extends StatefulWidget {
  final Widget child;
  final double padding;
  final double borderRadius;

  MaterialTile({@required this.child, this.padding=12, this.borderRadius=20});
  @override
  _MaterialTileState createState() => _MaterialTileState();
}

class _MaterialTileState extends State<MaterialTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Material(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            elevation: 7.0,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(widget.borderRadius)),
                    ),
                    child: widget.child))));
  }
}
