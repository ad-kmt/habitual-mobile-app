import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/provider/user_api.dart';

class MyAppRepository {
  final UserApiClient userApiClient;

  MyAppRepository({required this.userApiClient});

  Stream<UserModel?> getUser(String uid) {
    return userApiClient.getUserDataStream(uid);
  }
}
