import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/firebase_auth_api.dart';
import 'package:habitual/data/provider/user_api.dart';

class AuthRepository {
  final FirebaseAuthApiClient authApiClient;
  final UserApiClient userApiClient;

  AuthRepository({required this.authApiClient, required this.userApiClient});

  Stream<String?> getUserIdStream() {
    return authApiClient.getUserFromFirebase();
  }

  Stream<UserModel?> getUserDataStream(String? uid) {
    return userApiClient.getUserDataStream(uid);
  }

  Future<String?> loginWithEmailAndPass(String email, String password) {
    return authApiClient.signInWithEmailAndPass(email, password);
  }

  Future logout() {
    return authApiClient.signOut();
  }

  Future<String?> registerWithEmailAndPass(email, password) {
    return authApiClient.registerWithEmailAndPass(email, password);
  }
}
