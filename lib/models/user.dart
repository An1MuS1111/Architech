import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  static const bool _defaultIsLoggedIn = false;
  static const String _defaultEmail = '';

  bool _isLoggedIn = _defaultIsLoggedIn;
  String _email = _defaultEmail;

  bool get isLoggedIn => _isLoggedIn;
  String get email => _email;

  void login(String email, String password) {
    // Implement your login logic here
    // Set isLoggedIn to true if login is successful
    _isLoggedIn = true; // Example implementation, replace with actual logic
    _email = email; // Example implementation, replace with actual logic
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



