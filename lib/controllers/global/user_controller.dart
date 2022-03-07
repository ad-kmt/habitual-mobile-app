import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/controllers/global/auth_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/user_repository.dart';

class UserController extends GetxController {
  UserRepository userRepository;

  UserController({required this.userRepository});

  AuthController authController = Get.find();

  final Rx<UserModel?> userRx = Rx<UserModel?>(null);

  UserModel? get user => userRx.value;

  set user(UserModel? val) => userRx.value = val;

  @override
  void onInit() {
    super.onInit();
    // user = Rx<UserModel?>(authRepository.getCurrentUser());
    if (authController.userIdRx.value != null) {
      userRx.bindStream(
          userRepository.getUserDataStream(authController.userIdRx.value));
    }
    ever(authController.userIdRx, _bindUserDataStream);
  }

  _bindUserDataStream(userId) {
    if (userId == null) {
      user = null;
    } else {
      userRx.bindStream(userRepository.getUserDataStream(userId));
      log("User Data stream binded for user id: $userId");
    }
  }

  updateUserData(UserModel user) {
    log("Updating User Data");
    userRepository.updateUser(user);
  }
}
