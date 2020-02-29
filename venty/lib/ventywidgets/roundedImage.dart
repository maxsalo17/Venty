import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double width;
  final double height;
  final String asset;
  final isNetwork;
  RoundedImage(
      {this.width = 50, this.height = 50, this.asset, this.isNetwork = true});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(width)),
        height: height,
        width: width,
        child: isNetwork == true
            ? Image.network(
                asset,
                fit: BoxFit.cover,
              )
            : Image.asset(
                asset,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
