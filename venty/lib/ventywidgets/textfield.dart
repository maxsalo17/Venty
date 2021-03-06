import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

class VentyTextField extends StatefulWidget {
  Function(String) onChanged;
  bool isPassword;
  String hintText;
  String errorText;
  VentyTextField({this.isPassword, this.onChanged, this.hintText, this.errorText});
  @override
  _VentyTextFieldState createState() => _VentyTextFieldState();
}

class _VentyTextFieldState extends State<VentyTextField> {

  bool _isHidden = true;

  _toggleHidden(){
    setState(() {
          _isHidden=!_isHidden;
        });
  }

@override
  void initState() {
    widget.isPassword?_isHidden = true: _isHidden = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
                              primaryColor: VentyColors.primaryRed.withOpacity(0.5),
                              primaryColorDark: VentyColors.primaryRed.withOpacity(0.5),
                              splashColor: Colors.white70
                            ),
          child: new TextField(
                                        onChanged: widget.onChanged,
                                        obscureText: _isHidden,
                                        decoration: new InputDecoration(
                                           fillColor: Colors.white.withOpacity(0.3),
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                                  borderSide: BorderSide(color: Colors.transparent)
                                          ),
                                          suffixIcon: widget.isPassword?IconButton(icon: Icon(Icons.visibility), onPressed: _toggleHidden,):null,
                                          hintText: widget.hintText,
                                          errorText: widget.errorText,
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  180, 103, 107, 115),
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0)),
                                        ),
                                      ),
    );
  }
}

