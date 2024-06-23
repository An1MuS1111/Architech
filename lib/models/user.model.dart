import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String password;
  final String username;
  final String role;
  // final Timestamp accountCreatedAt;

  User({
    required this.email,
    required this.password,
    required this.username,
    required this.role
    // required this.accountCreatedAt,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      username: data['username'] ?? '',
      role: data['role'] ?? ''
      // accountCreatedAt: data['accountCreatedAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'role': role
      // 'accountCreatedAt': accountCreatedAt,
    };
  }
}
