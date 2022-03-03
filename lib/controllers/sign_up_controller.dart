import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/auth_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/signup_repository.dart';
import 'package:habitual/routes/app_pages.dart';

class SignUpController extends GetxController {
  final SignUpRepository signUpRepository;

  final AuthController authController = Get.find();

  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpController({required this.signUpRepository});

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signUpWithEmailAndPassword() async {
    log("Validating email and password");
    if (formKey.currentState!.validate()) {
      log("Email and Password Validated. Signing up now");
      log("Email: ${emailController.text} Pass: ${passwordController.text}");
      String? userId = await authController.registerWithEmailAndPass(
          emailController.text, passwordController.text);
      // log(result.toString());
      if (userId != null) {
        UserModel user = UserModel(
            uid: userId,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text);
        log(user.toString());
        bool userCreationStatus = await signUpRepository.createUser(user);
        if (userCreationStatus) {
          Get.offAllNamed(Routes.MY_APP);
          Get.snackbar(
              'Signup', 'Signup successful. Welcome ${user.firstName}!');
        } else {
          Get.snackbar(
              'Signup', 'Failed to create user. Please contact developers');
        }
      } else {
        Get.snackbar('Signup', 'Signup failed');
      }
    }
  }
}
