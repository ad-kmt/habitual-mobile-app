import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/auth_controller.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/data/utils/static_data.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/dimensions.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/cards/colored/colored_card_fixed.dart';
import 'package:habitual/ui/screens/global_widgets/cards/product/vertical_product_card_large.dart';
import 'package:habitual/ui/screens/global_widgets/cards/product/vertical_product_card_small.dart';
import 'package:habitual/ui/screens/product/args/product_screen_args.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthController authController = Get.find();

  final List<String> coloredCardTitleList = [
    "Shopping habits and interests",
    "Today’s trending items",
    "Incoming! Flash deals",
    "Browse our categories"
  ];
  final List<Color> cardColors = [
    AppColors.accentRed,
    AppColors.accentTeal,
    AppColors.accentIndigo,
    AppColors.accentOrange
  ];

  @override
  Widget build(BuildContext context) {
    log("home: " + authController.user.toString());
    log("home: " + authController.userIdRx.value.toString());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 537.h,
                ),

                /// Background Circle
                Positioned(
                    left: -36.w,
                    top: -368.h,
                    child: Container(
                      width: 752.r,
                      height: 752.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(386.r),
                          color: AppColors.primaryColor),
                    )),

                /// Title 1
                Positioned(
                  left: 24.w,
                  top: 77.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TRENDING",
                        style: AppTextStyles.h6.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textGray_80),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        width: 198.w,
                        child: Text(
                          "Find the stuff you love.",
                          style: AppTextStyles.h3.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textGray_80),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Login Avatar
                Positioned(
                  right: Dimensions.horizontalPadding,
                  top: 64.h,
                  child: GestureDetector(
                    onTap: () {
                      authController.user != null
                          ? Get.toNamed(Routes.EDIT_PROFILE)
                          : Get.toNamed(Routes.LOGIN);
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.bgWhite,
                            child: Icon(
                              Icons.person,
                              color: AppColors.uiGray_80,
                            ),
                          ),
                          Text(
                            authController.user?.firstName ?? 'Log in',
                            style: AppTextStyles.bodySmallBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Large Product Cards
                Positioned(
                  top: 176.h,
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: 360.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: StaticData.products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            double paddingLeft = (index == 0) ? 16.w : 0;
                            double paddingRight = (index == 4) ? 16.w : 0;

                            ProductModel product = StaticData.products[
                                StaticData.products.length - 1 - index];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  paddingLeft + 8, 8, paddingRight + 8, 0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.PRODUCT,
                                      arguments:
                                          ProductScreenArguments(product),
                                    );
                                  },
                                  child: VerticalProductCardLarge(
                                    product: product,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// TITLE 2
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "HOT DEALS",
                    style: AppTextStyles.h6.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textGray_80,
                    ),
                  ),
                  Text(
                    "SEE ALL",
                    style: AppTextStyles.h6.copyWith(
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                      color: AppColors.textGray_60,
                    ),
                  )
                ],
              ),
            ),

            /// SMALL VERTICAL PRODUCT CARDS
            SizedBox(
              width: Get.width,
              height: 327.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: StaticData.products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  double paddingLeft = (index == 0) ? 16.w : 0;
                  double paddingRight = (index == 4) ? 16.w : 0;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        paddingLeft + 8, 24, paddingRight + 8, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.PRODUCT,
                            arguments: ProductScreenArguments(
                                StaticData.products[index]),
                          );
                        },
                        child: VerticalProductCardSmall(
                          product: StaticData.products[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// COLORED CARDS
            Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 16.w,
                  crossAxisSpacing: 16.w,
                ),
                itemCount: coloredCardTitleList.length,
                itemBuilder: (context, index) {
                  return ColoredCardFixed(
                      title: coloredCardTitleList[index],
                      color: cardColors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
