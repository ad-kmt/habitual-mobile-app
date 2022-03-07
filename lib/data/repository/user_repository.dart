import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/user_api.dart';

class UserRepository {
  UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  Stream<UserModel?> getUserDataStream(String? uid) {
    return userApiClient.getUserDataStream(uid);
  }

  void updateUser(UserModel user) {
    userApiClient.updateUserData(user);
  }
}
