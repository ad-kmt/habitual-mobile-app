import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:habitual/controllers/edit_profile_screen_controller.dart';
import 'package:habitual/controllers/global/auth_controller.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/secondary_button.dart';
import 'package:habitual/ui/screens/global_widgets/input/base_input.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final EditProfileScreenController editProfileController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.w),
        child: PrimaryButton(
            text: "Logout",
            onClick: () {
              authController.logout();
              Get.back();
            }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 72.h,
              ),

              /// TITLE AND BACK ICON
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.uiGray_80,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Text(
                    "Profile",
                    style:
                        AppTextStyles.h5.copyWith(fontWeight: FontWeight.w800),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),

              ///PROFILE PHOTO AND EDIT ICON
              Stack(
                children: [
                  ///PROFILE PHOTO
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: AppColors.uiGray_20,
                    child: Icon(
                      Icons.person,
                      color: AppColors.uiGray_60,
                      size: 60.r,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.uiWhite,
                        size: 20.r,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),

              Form(
                key: editProfileController.formKey,
                child: Column(
                  children: [
                    BaseInput(
                      textEditingController:
                          editProfileController.firstNameController,
                      validator: editProfileController.firstNameValidator,
                      labelLeft: "First Name",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BaseInput(
                      textEditingController:
                          editProfileController.lastNameController,
                      labelLeft: "Last Name",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BaseInput(
                      textEditingController:
                          editProfileController.emailController,
                      labelLeft: "Email",
                      enabled: false,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SecondaryButton(
                        text: "Update",
                        onClick: () {
                          editProfileController.updateProfile();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
