import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/auth_repository.dart';

/*
  AuthController: Takes care of User Auth State.
 */

class AuthController extends GetxController {
  final AuthRepository authRepository;

  final Rx<String?> userIdRx = Rx<String?>(null);

  final _user = Rx<UserModel?>(null);

  UserModel? get user => _user.value;

  set user(val) => _user.value = val;

  AuthController({required this.authRepository});

  @override
  void onInit() {
    super.onInit();
    // user = Rx<UserModel?>(authRepository.getCurrentUser());
    userIdRx.bindStream(authRepository.getUserIdStream());
    if (userIdRx.value != null) {
      _user.bindStream(authRepository.getUserDataStream(userIdRx.value));
    }
    ever(userIdRx, _bindUserDataStream);
  }

  Future<String?> loginWithEmailAndPass(String email, String password) async {
    return await authRepository.loginWithEmailAndPass(email, password);
  }

  Future logout() async {
    return await authRepository.logout();
  }

  Future<String?> registerWithEmailAndPass(email, password) {
    return authRepository.registerWithEmailAndPass(email, password);
  }

  _bindUserDataStream(userId) {
    if (userId == null) {
      user = null;
    } else {
      _user.bindStream(authRepository.getUserDataStream(userId));
      log("User Data stream binded for user id: $userId");
    }
  }
}
