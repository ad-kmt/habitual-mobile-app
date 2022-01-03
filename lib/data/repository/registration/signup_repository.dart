import 'dart:developer';

import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/user_api.dart';

class SignUpRepository {
  final UserApiClient userApiClient;

  SignUpRepository({required this.userApiClient});

  Future<bool> createUser(UserModel userModel) {
    return userApiClient.updateUserData(userModel);
  }
}
