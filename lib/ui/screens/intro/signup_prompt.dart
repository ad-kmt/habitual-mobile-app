import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/strings.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';

class SignupPrompt extends StatelessWidget {
  const SignupPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 91.w,
              top: -133.h,
              child: Container(
                width: 390.r,
                height: 390.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(251.r),
                    color: AppColors.primaryColor_20),
              ),
            ),
            Positioned(
                left: -86.w,
                top: -130.h,
                child: Container(
                  width: 275.r,
                  height: 275.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(251.r),
                      color: AppColors.accentTeal.withOpacity(0.3)),
                )),
            Positioned(
                left: 78.w,
                top: -289.h,
                child: Container(
                  width: 366.r,
                  height: 366.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(251.r),
                      color: AppColors.accentRed.withOpacity(0.1)),
                )),
            Positioned(
              top: 180.h,
              child: SizedBox(
                  height: 171.h,
                  child: SvgPicture.asset(Assets.introImage1)),
            ),
            Positioned(
              top: 402.h,
              child: Column(
                children: [
                  SizedBox(height:50.h, child: SvgPicture.asset(Assets.logoPrimary)),
                  const SizedBox(height: 16,),
                  const Text(Strings.signUpPromptBody, style: AppTextStyles.bodyLarge,)
                ],
              ),
            ),
            Positioned(
              bottom: 100.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(
                  text: Strings.signUpButton,
                  onClick: () {},
                ),
              ),
            ),
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children:  [
                    const Text(Strings.existingAccount, style: AppTextStyles.bodyRegular,),
                    SizedBox(width: 8.w,),
                    Text(Strings.logInButton, style: AppTextStyles.linkRegular.copyWith(fontWeight: FontWeight.w800),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
