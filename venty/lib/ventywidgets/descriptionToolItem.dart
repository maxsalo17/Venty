import 'package:flutter/material.dart';

class DescriptionToolItem extends StatelessWidget {
  final double width;
  final double height;
  final String assetName;
  final Function onPressed;
  DescriptionToolItem(
      {Key key,
      this.height = 70.0,
      this.width = 70.0,
      @required this.assetName,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: 7.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              assetName,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}
