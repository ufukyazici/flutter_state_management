import 'package:flutter/material.dart';

class ProjectContext extends ChangeNotifier {
  String newUserName = '';
  void changeName(String name) {
    newUserName = name;

    notifyListeners();
  }
}
