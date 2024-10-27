import 'package:flutter/material.dart';

class ValidationProvider extends ChangeNotifier{
  bool obscureText = true;
  void showPasswordPress()
  {
    obscureText = !obscureText;
    notifyListeners();
  }

}