//Firestore User Database API
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habitual/data/models/user_model.dart';

class UserApiClient {
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> updateUserData(UserModel userModel) async {
    log("Updating user data for user: ${userModel.toString()}");
    try {
      await userCollection.doc(userModel.uid).update(userModel.toJson());
      log("User updated successfully");
      return true;
    } catch (e) {
      log("Failed to update user");
      log(e.toString());
      return false;
    }
  }

  //user data from snapshot
  UserModel _userModelFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> userMap = snapshot.data() as Map<String, dynamic>;
    return UserModel.fromJson(userMap);
  }

  //get user model stream. Realtime approach
  Stream<UserModel> getUserDataStream(String? uid) {
    return userCollection.doc(uid).snapshots().map(_userModelFromSnapshot);
  }

  Future<UserModel> getUserData(String? uid) async {
    DocumentSnapshot documentSnapshot = await userCollection.doc(uid).get();
    return _userModelFromSnapshot(documentSnapshot);
  }
}
