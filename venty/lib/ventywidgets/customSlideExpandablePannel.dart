import 'package:flutter/material.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';

import 'materialTile.dart';

class CustomSlideExpandablePannel extends StatefulWidget {
  double minHeight;
  double maxExpandHeight;
  double expnadDelta;
  Widget child;
  EdgeInsets padding;
  Color color;
  CustomSlideExpandablePannel(
      {this.minHeight = 60,
      this.child,
      this.color,
      this.expnadDelta = 150,
      this.maxExpandHeight = 500});
  @override
  _CustomSlideExpandablePannelState createState() =>
      _CustomSlideExpandablePannelState();
}

class _CustomSlideExpandablePannelState
    extends State<CustomSlideExpandablePannel> {
  double currentHeight = 0;
  bool isExpanded = false;
  bool isPressed = false;

  _setExpanded(bool) {
    setState(() {
      isExpanded = bool;
    });
  }

  @override
  void initState() {
    currentHeight = widget.minHeight;
    super.initState();
  }

  _setHeight(double) {
    setState(() {
      currentHeight = double;
      if (double >= widget.maxExpandHeight) {
        isExpanded = true;
      } else {
        isExpanded = false;
      }
    });
  }

  _onVerticalDragStart(DragStartDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  _onVerticalDragEnd(DragEndDetails details) {
    setState(() {
      isPressed = false;
    });
    if (currentHeight < widget.minHeight + widget.expnadDelta) {
      _setHeight(widget.minHeight);
    } else if (currentHeight < widget.maxExpandHeight) {
      _setHeight(widget.maxExpandHeight);
    }
  }

  _onVerticalDragUpdate(DragUpdateDetails details) {
    currentHeight = currentHeight + details.primaryDelta * -1;
    currentHeight < widget.minHeight
        ? currentHeight = widget.minHeight
        : currentHeight = currentHeight;
    _setHeight(currentHeight);
  }

  _expand() {
    _setHeight(widget.maxExpandHeight);
  }

  _collapse() {
    _setHeight(widget.minHeight);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialTile(
      borderRadius: 30,
      padding: EdgeInsets.all(0),
      child: GestureDetector(
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragEnd: _onVerticalDragEnd,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: isPressed ? 0 : 400),
            curve: Curves.easeOutCubic,
            height: currentHeight ?? widget.minHeight ?? 0,
            child: Stack(
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: isExpanded ? _collapse : _expand,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: VentyColors.conseptDark,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    widget.child,
                  ],
                ),
                //Shade content
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    
                    child: isExpanded
                        ? InkWell(
                            onTap: _collapse,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.keyboard_arrow_down),
                                Text("Close",
                                    style: TextStyles.smallItemTextDark)
                              ],
                            ),
                          )
                        : SizedBox(height: 50,),
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.white.withOpacity(0.1),
                          widget.color
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
