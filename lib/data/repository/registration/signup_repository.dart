import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/firebase_auth_api.dart';
import 'package:habitual/data/provider/user_api.dart';

class SignUpRepository {
  final UserApiClient userApiClient;
  final FirebaseAuthApiClient authApiClient;

  SignUpRepository({
    required this.userApiClient,
    required this.authApiClient,
  });

  Future<bool> createUser(UserModel userModel) {
    return userApiClient.updateUserData(userModel);
  }

  Future<String?> registerWithEmailAndPass(email, password) {
    return authApiClient.registerWithEmailAndPass(email, password);
  }
}
