import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

import 'materialTile.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: MaterialTile(
          padding: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
         
            child: TextField(decoration: InputDecoration(suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){},)),),
          ),
                  ),
        ),
      ),
    );
  }
}