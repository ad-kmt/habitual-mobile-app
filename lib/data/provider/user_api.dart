//Firestore User Database API
import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habitual/data/models/user_model.dart';

class UserApiClient {
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> updateUserData(UserModel userModel) async {
    log("Updating user data for user: ${userModel.toString()}");
    try {
      await userCollection.doc(userModel.uid).set({
        'firstName': userModel.firstName,
        'lastName': userModel.lastName,
        'email': userModel.email,
      });
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
    return UserModel(
      uid: snapshot.id,
      firstName: snapshot.get('firstName'),
      lastName: snapshot.get('lastName'),
      email: snapshot.get('email'),
    );
  }

  //get user model stream. Realtime approach
  Stream<UserModel> getUserDataStream(String uid) {
    return userCollection.doc(uid).snapshots().map(_userModelFromSnapshot);
  }
}
