import 'package:habitual/data/provider/firebase_auth_api.dart';

class LoginRepository {
  final FirebaseAuthApiClient authApiClient;

  LoginRepository({required this.authApiClient});

  Future<String?> loginWithEmailAndPass(String email, String password) {
    return authApiClient.signInWithEmailAndPass(email, password);
  }
}
