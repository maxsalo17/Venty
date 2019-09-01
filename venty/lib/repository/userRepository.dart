import 'package:firebase_auth/firebase_auth.dart';
import 'package:venty/api/userApi.dart';
import 'package:venty/models/userAuthorize.dart';
import 'package:venty/models/userModel.dart';

class UserRepository{
  UserApi _api = UserApi();

  Future<User> tryAuthorize(UserAuthentication userAuthentication)async{
    FirebaseUser firebaseUser = await _api.tryAuthorizeFirebase(userAuthentication);
    User user;
    if(firebaseUser!=null){
      user = User(firebaseUser.uid, firebaseUser.email, firebaseUser.isEmailVerified);
    }
    return user;
  }

  Future<User> tryRegister(UserAuthentication userAuthentication)async{
    FirebaseUser firebaseUser = await _api.tryRegisterFirebase(userAuthentication);
    User user;
    if(firebaseUser!=null){
      user = User(firebaseUser.uid, firebaseUser.email, firebaseUser.isEmailVerified);
    }
    return user;
  }
}