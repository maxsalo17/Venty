import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

class BeautifulButton extends StatelessWidget {
  final double height;
  final double width;
  final Color swatchColor;
  final Function onPressed;
  final String text;
  final IconData icon;

  BeautifulButton({this.height = 35.0,this.width = 100.0,this.swatchColor = VentyColors.primaryRed,this.onPressed,this.text = 'button',this.icon = Icons.menu});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                    color: VentyColors.primaryDark,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: height,
                width: width * 0.7,
              ),
              Container(
                child: Icon(icon,color: swatchColor),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: height,
                width: width * 0.3,
              ),
            ],
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.1),Colors.transparent,Colors.black.withOpacity(0.05)], 
                 begin: FractionalOffset.centerRight,
                 end: FractionalOffset.centerLeft,),
            ),
          ),
          Container(
          height: height,
          width: width,
          child: FlatButton(
            child: SizedBox(),
            color: Colors.transparent,
            onPressed: onPressed,
          ),
              ),
        ],
      ),
    );
  }
}
