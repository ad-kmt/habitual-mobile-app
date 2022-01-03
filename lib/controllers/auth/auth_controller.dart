import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/auth/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final Rx<UserModel?> _user = Rx<UserModel?>(null);

  UserModel? get user => _user.value;

  set user(val) => _user.value = val;

  @override
  void onInit() {
    super.onInit();
    // user = Rx<UserModel?>(authRepository.getCurrentUser());
    _user.bindStream(authRepository.getUserStream());
  }

  Future<UserModel?> loginWithEmailAndPass(
      String email, String password) async {
    return await authRepository.loginWithEmailAndPass(email, password);
  }

  Future logout() async {
    return await authRepository.logout();
  }

  Future<UserModel?> registerWithEmailAndPass(email, password) {
    return authRepository.registerWithEmailAndPass(email, password);
  }
}
