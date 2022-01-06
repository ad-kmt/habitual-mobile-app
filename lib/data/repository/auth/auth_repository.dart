import 'package:habitual/data/provider/firebase_auth_api.dart';

class AuthRepository {
  final FirebaseAuthApiClient authApiClient;

  AuthRepository({required this.authApiClient});

  Stream<String?> getUserStream() {
    return authApiClient.getUserFromFirebase();
  }

  String? getCurrentUser() {
    return authApiClient.getCurrentUserId();
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
