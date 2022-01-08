import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/controllers/auth/auth_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/my_app/my_app_repository.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyAppController extends GetxController {
  final MyAppRepository myAppRepository;

  MyAppController({required this.myAppRepository});

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  final AuthController authController = Get.find();

  final _user = Rx<UserModel?>(null);

  UserModel? get user => _user.value;

  set user(val) => _user.value = val;

  @override
  void onInit() {
    super.onInit();
    // user = Rx<UserModel?>(authRepository.getCurrentUser());
    if (authController.userIdRx.value != null) {
      _user.bindStream(
          myAppRepository.getUserDataStream(authController.userIdRx.value));
    }
    ever(authController.userIdRx, _bindUserDataStream);
  }

  _bindUserDataStream(userId) {
    if (userId == null) {
      user = null;
    } else {
      _user.bindStream(myAppRepository.getUserDataStream(userId));
      log("User Data stream binded for user id: $userId");
    }
  }
}
