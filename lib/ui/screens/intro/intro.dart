import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/auth/auth_controller.dart';
import 'package:habitual/controllers/intro/intro_controller.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/dimensions.dart';
import 'package:habitual/ui/constants/strings.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/tertiary_button.dart';
import 'package:habitual/ui/screens/global_widgets/loading.dart';
import 'package:habitual/ui/screens/intro/widgets/intro_content.dart';

class Intro extends StatelessWidget {
  final IntroController introController = Get.find();
  final AuthController authController = Get.find();

  final List<Map<String, String>> introTextData = [
    {
      "title": Strings.introTitle1,
      "body": Strings.introBody1,
      "image": Assets.introImage1
    },
    {
      "title": Strings.introTitle2,
      "body": Strings.introBody2,
      "image": Assets.introImage2
    },
    {
      "title": Strings.introTitle3,
      "body": Strings.introBody3,
      "image": Assets.introImage3
    },
  ];

  final List<Map<String, Color>> introBGAccentColor = [
    {"color": AppColors.primaryColor_20},
    {"color": AppColors.accentTeal.withOpacity(0.1)},
    {"color": AppColors.accentRed.withOpacity(0.1)},
  ];

  Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return introController.loading
          ? const Loading()
          : Scaffold(
              body: SafeArea(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Positioned(left: -152, top: -59,child: Container(width: 452.r, height: 452.r, decoration: BoxDecoration(borderRadius: BorderRadius.circular(251.r), color: AppColors.primaryColor_20),)),

                    SizedBox(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: PageView.builder(
                              onPageChanged: (value) {
                                introController.currentPage = value;
                              },
                              itemCount: introTextData.length,
                              itemBuilder: (context, index) => IntroContent(
                                image: introTextData[index]["image"],
                                body: introTextData[index]["body"],
                                title: introTextData[index]["title"],
                                backgroundCircleColor: introBGAccentColor[index]
                                    ["color"],
                                backgroundCirclePosition: index % 2 == 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 134.h,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              introTextData.length,
                              (index) => buildDot(index: index),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 40.h,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalPadding),
                        child: PrimaryButton(
                          text: Strings.next,
                          onClick: () {
                            Get.toNamed(Routes.INTRO_SIGN_UP);
                          },
                        ),
                      ),
                    ),

                    ///SKIP BUTTON
                    Positioned(
                      top: 58.h,
                      right: 28.w,
                      child: TertiaryButton(
                        text: Strings.skip,
                        onClick: () {
                          if (authController.userIdRx.value == null) {
                            log("User is not authenticated. Going to SIGN UP page");
                            Get.toNamed(Routes.INTRO_SIGN_UP);
                          } else {
                            log("User is authenticated. Going to HOME page");
                            Get.offNamed(Routes.MY_APP);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }

  Obx buildDot({int? index}) {
    return Obx(
          () => AnimatedContainer(
        duration: const Duration(milliseconds: 135),
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: introController.currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: introController.currentPage == index
              ? AppColors.primaryColor
              : AppColors.uiGray_40,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  void printScreenInformation() {
    print('Device width dp:${1.sw}dp');
    print('Device height dp:${1.sh}dp');
  }
}
