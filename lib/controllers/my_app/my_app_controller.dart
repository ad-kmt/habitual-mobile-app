import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/controllers/auth/auth_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/my_app/my_app_repository.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _user.bindStream(myAppRepository.getUser(authController.user!.uid!));
  }
}
