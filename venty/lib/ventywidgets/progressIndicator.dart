import 'package:flutter/material.dart';

class VentyProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
                data: ThemeData(primarySwatch: Colors.red),
                            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 3.0,
        ),
              );
  }
}