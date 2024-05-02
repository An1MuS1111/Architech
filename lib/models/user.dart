import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _email = '';

  bool get isLoggedIn => _isLoggedIn;
  String get email => _email;

  void login(String email, String password) {
    // Implement your login logic here
    // Set isLoggedIn to true if login is successful
    _isLoggedIn = true;
    _email = email;
    notifyListeners();
  }

  void logout() {
    // Implement your logout logic here
    // Set isLoggedIn to false
    _isLoggedIn = false;
    _email = '';
    notifyListeners();
  }
}

