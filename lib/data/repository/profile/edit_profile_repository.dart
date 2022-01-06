import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/user_api.dart';

class EditProfileRepository {
  final UserApiClient userApiClient;

  EditProfileRepository({required this.userApiClient});

  Future<bool> updateUser(UserModel userModel) {
    return userApiClient.updateUserData(userModel);
  }
}
