import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/firebase_auth_api.dart';

class AuthRepository {
  final FirebaseAuthApiClient authApiClient;

  AuthRepository({required this.authApiClient});

  Stream<UserModel?> getUserStream() {
    return authApiClient.getUserFromFirebase();
  }

  UserModel? getCurrentUser() {
    return authApiClient.getCurrentUser();
  }

  Future<UserModel?> loginWithEmailAndPass(String email, String password) {
    return authApiClient.signInWithEmailAndPass(email, password);
  }

  Future logout() {
    return authApiClient.signOut();
  }

  Future<UserModel?> registerWithEmailAndPass(email, password) {
    return authApiClient.registerWithEmailAndPass(email, password);
  }
}
