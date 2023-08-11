import 'package:flutter/material.dart';
import 'package:flutter_app/user/models/pharmacie.dart';


class pharmacieProvider extends ChangeNotifier {
  pharmacie _user = pharmacie(
    id: '',
    name: '',
    phone: '',
    email: '',
    password: '',
    passwordconf: '', 
    profession: '', 
    image: ''

  );

  pharmacie get user => _user;

  void setUser(String user) {
    _user = pharmacie.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(pharmacie user) {
    _user = user;
    notifyListeners();
  }
}
