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

  FormData getRegisterData(){
    var data = new FormData.from(
      {
        "Email":email,
        "Password":password,
        "ConfirmPassword":confirmPassword,
      }
    );
    return data;

  }

   FormData getAutorizationData(){
    var data = new FormData.from(
      {
        "grant_type": 'password',
        "username":email,
        "password":password,
      }
    );
    return data;
  }
    
    
}