import 'package:rxdart/rxdart.dart';
import 'package:venty/models/userModel.dart';
import 'package:venty/repository/userRepository.dart';
import 'package:venty/models/userAuthorize.dart';

class AuthenticationBloc {
  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  BehaviorSubject<String> _confirmPasswordController =
      BehaviorSubject<String>();
  BehaviorSubject<String> _errorController = BehaviorSubject<String>();

  BehaviorSubject<bool> _progressController = BehaviorSubject<bool>();

  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;
  Stream<String> get confirmPassword => _confirmPasswordController.stream;
  Stream<String> get error => _errorController.stream;
  Stream<bool> get progress => _progressController.stream;

  Function(String) get emailValue => _emailController.sink.add;
  Function(String) get passwordValue => _passwordController.sink.add;
  Function(String) get confirmPasswordValue =>
      _confirmPasswordController.sink.add;
  Function(String) get errorValue => _errorController.sink.add;

  register({Function onSuccess, Function onError}) async {
    UserAuthentication userAuthentication = getUserData();
    if (validate(userAuthentication, true)) {
      setInProgress(true);
      UserRepository api = UserRepository();
      User user = await api.tryRegister(userAuthentication);
      if (user != null) {
        onSuccess != null ? onSuccess() : () {};
      } else {
        if (onError != null) {
          onError();
        } else
          print("Errror");
      }
      setInProgress(false);
    }
  }

  autorize({Function onSuccess, Function onError}) async {
    UserAuthentication userAuthentication = getUserData();
    if (validate(userAuthentication, false)) {
      setInProgress(true);
      UserRepository api = UserRepository();
      User user = await api.tryAuthorize(userAuthentication);
      print(user.uid);
      if (user != null) {
        onSuccess != null ? onSuccess() : () {};
      } else {
        if (onError != null) {
          onError();
        } else
          print("Errror");
      }
      setInProgress(false);
    }
  }

  UserAuthentication getUserData() {
    UserAuthentication user = UserAuthentication(
        email: _emailController.stream.value,
        confirmPassword: _confirmPasswordController.stream.value,
        password: _passwordController.stream.value,
        error: "");
    print(user.email.toString() +
        " " +
        user.password.toString() +
        " " +
        user.confirmPassword.toString());
    return user;
  }

  bool validate(UserAuthentication user, bool isRegister) {
    bool isValid = true;
    if (user.email == null || user.email.isEmpty) {
      isValid = false;
      _emailController.sink.addError("E-mail must be not empty");
    }
    if (isRegister == true) {
      if (user.password != null && user.confirmPassword != null) {
        print("Password is " +
            user.password.toString() +
            user.confirmPassword.toString());
        if (user.password.length > 8) {
          if (user.password != user.confirmPassword) {
            isValid = false;
            _confirmPasswordController.sink.addError("Passwords are not same");
          } else
            isValid = true;
        } else{
          isValid = false;
        _passwordController.sink.addError("Password must be 8 or more symbols");}
      } else {
        _passwordController.sink.addError("Fill password field");
        _confirmPasswordController.sink.addError("Confirm your password");
        isValid = false;
      }
    } else {
      if (user.password == null || user.password.isEmpty) {
        isValid = false;
        _passwordController.sink.addError("Fill password field");
      } else if (user.password.length < 8) {
        isValid = false;
        _passwordController.sink.addError("Incorrect password");
      }
    }
    return isValid;
  }

  setInProgress(bool) {
    _progressController.sink.add(bool);
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _errorController.close();
    _progressController.close();
  }
}
