import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/dimensions.dart';
import 'package:habitual/ui/constants/strings.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/tertiary_button_light.dart';

class IntroSignUp extends StatelessWidget {
  const IntroSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ///BACKGROUND CIRCLE
            Positioned(
              left: -101,
              top: -59,
              child: Container(
                width: 452.r,
                height: 452.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(251.r),
                  color: AppColors.blue.withOpacity(0.1),
                ),
              ),
            ),

            ///LOGO
            Positioned(
              top: 50.h,
              child: SizedBox(
                  height: 32.h, child: SvgPicture.asset(Assets.logoBlack)),
            ),

            SizedBox(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.horizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Spacer(
                            flex: 2,
                          ),

                          /// ILLUSTRATION
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 243.h,
                                    child:
                                        SvgPicture.asset(Assets.introImage4)),
                              ],
                            ),
                          ),

                          ///TITLE
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.w),
                                  child: Text(
                                    Strings.introTitle4,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.h3.copyWith(
                                        color: AppColors.uiGray_80,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///DESCRIPTION
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  Strings.introBody4,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodyRegular,
                                ),
                              ],
                            ),
                          ),

                          const Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///SIGNUP BUTTON
            Positioned(
              bottom: 93.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalPadding),
                child: PrimaryButton(
                  text: Strings.signUpButton,
                  onClick: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                ),
              ),
            ),

            ///ASK ME LATER
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalPadding),
                child: TertiaryButtonLight(
                  text: Strings.askLater,
                  onClick: () {
                    Get.offAllNamed(Routes.MY_APP);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
