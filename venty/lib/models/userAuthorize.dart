import 'package:dio/dio.dart';

class UserAuthentication{
  String email;
  String password;
  String confirmPassword;
  String error;

  UserAuthentication({this.email, this.password, this.confirmPassword, this.error});

  UserAuthentication.withError(String _error):
    email = "",
    password = "",
    confirmPassword = "",
    error = _error;

  
    
    
}