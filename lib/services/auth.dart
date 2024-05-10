// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Register with email and password (with secure password handling)
//   Future<UserCredential?> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       // Validate email and password format (optional, can be done on UI)

//       final userCredential = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       return userCredential; // Return the UserCredential for further actions
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The email address is already in use by another account.');
//       } else {
//         print(e.message);
//       }
//       return null; // Return null to indicate registration failure
//     } catch (e) {
//       print(e.toString()); // Log any other unexpected errors
//       return null;
//     }
//   }

//   // Log in with email and password (with secure password handling)

//   Future<UserCredential?> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       // Navigate to the home screen or show success message
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         // Display error: "User not found"
//       } else if (e.code == 'wrong-password') {
//         // Display error: "Invalid password"
//       } else {
//         // Display generic error message
//       }
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }

    return null;
  }
}
