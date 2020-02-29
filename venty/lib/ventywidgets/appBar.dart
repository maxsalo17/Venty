import 'package:flutter/material.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';

class VentyAppBar extends StatelessWidget {
  final String title;
  final Widget trailing;
  VentyAppBar({this.title, this.trailing});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: VentyColors.conseptWhite,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title ?? "",
              style: TextStyles.appBarTitle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
