import 'package:flutter/material.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/tools/theme.dart';

class CategoryButton extends StatelessWidget {
  String text;
  Function onPressed;
  CategoryButton({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: VentyColors.conseptPurple.withOpacity(0.8)),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          child: Text(
            text,
            style: TextStyles.conseptWhiteH2Text,
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
