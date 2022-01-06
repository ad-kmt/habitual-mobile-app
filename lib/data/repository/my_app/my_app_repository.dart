import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/firebase_auth_api.dart';
import 'package:habitual/data/provider/user_api.dart';

class MyAppRepository {
  final UserApiClient userApiClient;
  final FirebaseAuthApiClient authApiClient;

  MyAppRepository({required this.userApiClient, required this.authApiClient});

  Stream<UserModel?> getUserDataStream(String? uid) {
    return userApiClient.getUserDataStream(uid);
  }

  Future<UserModel> getUserData(String? uid) {
    return userApiClient.getUserData(uid);
  }
}
