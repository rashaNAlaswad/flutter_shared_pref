import 'package:get/get.dart';

import '../../../data/models/user.dart';

class LoginController extends GetxController {
  User _user = User(email: '', password: '');

  User get user => _user;

  void setEmail(String email) {
    _user.email = email;
    update();
  }

  void setPassword(String password) {
    _user.password = password;
    update();
  }

  bool login() {
    if (_user.email == 'test@gmail.com' && _user.password == '12345678') {
      return true;
    }
    return false;
  }

  void clearFields() {
    _user = User(email: '', password: '');
    update();
  }
}
