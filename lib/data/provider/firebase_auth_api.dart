import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitual/data/models/user_model.dart';

class FirebaseAuthApiClient {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create UserModel object based on Firebase User
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> getUserFromFirebase() {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Sign in with email and password
  Future<UserModel?> signInWithEmailAndPass(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future<UserModel?> registerWithEmailAndPass(
      String email, String password) async {
    try {
      log("Registring on Firebase with Email and Password");
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      log("User Credentials" + userCredential.toString());
      User? user = userCredential.user;
      // await DatabaseService(uid: user!.uid)
      //     .updateUserData('0', 'new brew member', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      log("Logging out user");
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  UserModel? getCurrentUser() {
    return _userFromFirebaseUser(_auth.currentUser);
  }
}
