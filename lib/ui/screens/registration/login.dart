import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:habitual/controllers/login_screen_controller.dart';
import 'package:habitual/data/utils/validators.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/social_media_button.dart';
import 'package:habitual/ui/screens/global_widgets/divider/app_divider_medium.dart';
import 'package:habitual/ui/screens/global_widgets/input/base_input.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  LoginScreenController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              ///LOGIN TITLE
              Container(
                decoration: BoxDecoration(
                  color: AppColors.uiWhite,
                  border: Border(
                    bottom: BorderSide(width: 1.h, color: AppColors.uiGray_20),
                  ),
                ),
                height: 104.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ///CLOSE Button
                    Positioned(
                      top: 64.h,
                      left: 0.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColors.uiGray_80,
                        ),
                      ),
                    ),

                    ///TITLE
                    Positioned(
                      top: 64.h,
                      child: Text(
                        "Login",
                        style: AppTextStyles.h5.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),

              ///LOGO
              SvgPicture.asset(
                Assets.logoPrimary,
                height: 40.h,
              ),
              SizedBox(
                height: 24.h,
              ),
              Form(
                key: loginController.formKey,
                child: Column(
                  children: [
                    /// EMAIL INPUT
                    BaseInput(
                      labelLeft: "Email",
                      validator: Validation.emailValidator,
                      textEditingController: loginController.emailController,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    /// PASSWORD INPUT
                    BaseInput(
                      isObscureText: true,
                      labelLeft: "Password",
                      validator: Validation.passwordValidator,
                      textEditingController: loginController.passwordController,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    /// LOGIN BUTTON
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            text: "Login",
                            onClick: () {
                              loginController.loginWithEmailAndPassword();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),

              /// FORGOT PASSWORD
              Row(
                children: [
                  Text(
                    "Forgot Password",
                    style: AppTextStyles.linkSmall
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),

              /// DIVIDER
              Row(
                children: [
                  const Expanded(child: AppDividerMedium()),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    "or",
                    style: AppTextStyles.linkRegular.copyWith(
                      height: 1.0,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  const Expanded(child: AppDividerMedium()),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),

              ///SOCIAL MEDIA BUTTONS
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SocialMediaButton(
                          text: "Continue with Apple",
                          imageSvg: "assets/images/social_media/apple.svg",
                          onClick: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SocialMediaButton(
                          text: "Continue with Facebook",
                          imageSvg: "assets/images/social_media/facebook.svg",
                          onClick: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SocialMediaButton(
                          text: "Continue with Google",
                          imageSvg: "assets/images/social_media/google.svg",
                          onClick: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),

              /// SIGNUP LINK
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "New to Habitual?",
                    style: AppTextStyles.bodyRegular,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed(Routes.SIGNUP);
                    },
                    child: Text(
                      "Sign up",
                      style: AppTextStyles.linkRegular
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
