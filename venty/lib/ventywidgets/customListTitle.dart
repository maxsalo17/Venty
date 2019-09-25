import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTitle(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.deepPurple,
        onTap: onTap,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        Icon(icon, color: Color.fromRGBO(127, 127, 127, 8.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Segoe UI',
                          color: Color.fromRGBO(127, 127, 127, 8.0)),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right,
                  color: Color.fromRGBO(127, 127, 127, 8.0)),
            ],
          ),
        ),
      ),
    );
  }
}
