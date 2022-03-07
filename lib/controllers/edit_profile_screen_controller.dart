import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/user_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/edit_profile_repository.dart';

class EditProfileScreenController extends GetxController {
  final EditProfileRepository editProfileRepository;
  final UserController userController = Get.find();

  EditProfileScreenController({required this.editProfileRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    firstNameController.text = userController.user?.firstName ?? "";
    lastNameController.text = userController.user?.lastName ?? "";
    emailController.text = userController.user?.email ?? "";
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  String? firstNameValidator(String? val) {
    return val!.isEmpty ? "Enter first name" : null;
  }

  updateProfile() async {
    log("Validating form");
    if (formKey.currentState!.validate()) {
      log("Form Validated. Updating profile");
      log("First name: ${firstNameController.text} Last name: ${lastNameController.text}");

      UserModel user = userController.user!;
      user.firstName = firstNameController.text;
      user.lastName = lastNameController.text;
      bool result = await editProfileRepository.updateUser(user);
      // log(result.toString());
      if (result) {
        log(result.toString());
        Get.back();
        Get.snackbar(
            'Hi ${user.firstName}', 'Your profile is updated successfully');
      } else {
        Get.snackbar(
            'Alert!', 'Failed to update profile. Please contact developers.');
      }
    }
  }
}
