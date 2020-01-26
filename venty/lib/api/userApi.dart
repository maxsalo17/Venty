
import 'package:firebase_auth/firebase_auth.dart';
import '../models/userAuthorize.dart';

class UserApi {
  // Future<bool> tryRegister(FormData userData) async {
  //   Dio _apiHandler = Dio();
  //   try {
  //     await _apiHandler.post("${Configs.apiEndpoint}/api/Account/Register",
  //         data: userData, options: Options(contentType:ContentType.json ));

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> tryAutorize(FormData userData) async {
  //   Dio _apiHandler = Dio();
  //   try {
  //     _apiHandler.post("${Configs.apiEndpoint}/Token",
  //         data: userData, options: Options(contentType: ContentType.json, responseType: ResponseType.json, headers: {"Accept": "application/json",
  // "content-type": "application/json"}));

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<FirebaseUser> tryAuthorizeFirebase(
      UserAuthentication userAuthentication) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userAuthentication.email,
              password: userAuthentication.password);
      print("Wait for result");
      print(result.toString());
      if (result != null) {
        FirebaseUser user = result.user;
        print("FirebaseUser "+user.toString());
        return user;
      } else
        return null;
    } catch (e) {
      print("Exception occured $e");
      return null;
    }
  }

  Future<FirebaseUser> tryRegisterFirebase(
      UserAuthentication userAuthentication) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userAuthentication.email,
              password: userAuthentication.password);
      if (result != null) {
        FirebaseUser user = result.user;
        return user;
      } else
        return null;
    } catch (e) {
      print("Exception occured $e");
      return null;
    }



    
  }
}
