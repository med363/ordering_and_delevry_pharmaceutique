import 'package:flutter/material.dart';
import 'package:flutter_app/user/models/user.dart';


class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    phone: '',
    email: '',
    password: '',
    passwordconf: '', 
    profession: '',
    

  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
