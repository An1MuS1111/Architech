import 'package:architech/components/snackBar.dart';
import 'package:architech/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(
      String email, String username, String password, BuildContext context) async {
    String role = "user";

    try {
      // UserCredential credential = await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password)
      //     .then((value) => {postDetailsToFirestore(email, username, password, role)});
      // return credential.user;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, username, password, role)});

      showSnackBar(context, "You are successfully registered");
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print("Some error occured");
    }

    return null;
  }

  postDetailsToFirestore(String email, String username, String password, String role){
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;

    CollectionReference ref = firebaseFirestore.collection('users');
    ref.doc(user!.uid).set({'email': email, 'username': username, 'password': password, 'role': role});
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

  Future<User?> resetPasswordWithEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Some error occured");
    }
  }
}
