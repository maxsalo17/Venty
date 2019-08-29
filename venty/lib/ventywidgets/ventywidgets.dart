import 'package:flutter/material.dart';


class RoundedImage extends StatelessWidget{
double width = 30.0;
double height =30.0;
NetworkImage image = Image.network("").image;

RoundedImage(this.width,this.height,this.image);

@override
  Widget build(BuildContext context){
    return new Container(
                            width: width,
                            height: height,
                            decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    
                                    blurRadius:
                                        10.0, // has the effect of softening the shadow
                                    
                                    offset: Offset(
                                      5.0, // horizontal, move right 10
                                      5.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image:image )));
  }

}


class PopUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      
      content: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(320.0))
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new FlatButton(
              child: new Text(
                "Create event",
                style: new TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0
                ),
                
              ),
              onPressed: (){},
            ),
            new FlatButton(
              child: new Text(
                "Add photos",
                style: new TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0
                ),
                
              ),
              onPressed: (){},
            ),
            new FlatButton(
              child: new Text(
                "Change profile photo",
                style: new TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0
                ),
                
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      
    );
  }

}