import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/global/auth_controller.dart';
import 'package:habitual/controllers/global/user_controller.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/secondary_button.dart';
import 'package:habitual/ui/screens/global_widgets/cards/icon/icon_card.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80.h,
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
                            style: AppTextStyles.h5
                                .copyWith(fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Obx(
                      () {
                        if (userController.user != null) {
                          return SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 28.h,
                                ),

                                /// USER AVATAR
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.r,
                                      backgroundColor: AppColors.uiGray_20,
                                      child: Icon(
                                        Icons.person,
                                        color: AppColors.uiGray_60,
                                        size: 40.r,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),

                                    /// USER NAME
                                    Text(
                                      userController.user?.firstName ?? "NaN",
                                      style: AppTextStyles.h4.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textGray_80),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),

                                ///DESCRIPTION
                                Text(
                                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia.",
                                  style: AppTextStyles.bodyRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGray_60,
                                    height: 24 / 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),

                                ///EDIT PROFILE BUTTON
                                SecondaryButton(
                                  text: "Edit my profile",
                                  iconLeft: Icons.edit,
                                  onClick: () {
                                    Get.toNamed(Routes.EDIT_PROFILE);
                                  },
                                ),
                                SizedBox(
                                  height: 26.h,
                                ),

                                ///INTERESTS TITLE AND EDIT
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "MY INTERESTS",
                                      style: AppTextStyles.label.copyWith(
                                          color: AppColors.uiGray_80,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      "EDIT",
                                      style: AppTextStyles.linkSmall.copyWith(
                                          color: AppColors.uiGray_60,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),

                                ///INTERESTS CARD (EMPTY)
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.bgWhite,
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: AppShadows.cardShadowLarge,
                                  ),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.r),
                                  child: Column(
                                    children: [
                                      ///ILLUSTRATION
                                      SvgPicture.asset(
                                        Assets.interestsEmpty,
                                        height: 72.h,
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),

                                      ///INTERESTS CARD TITLE
                                      Text(
                                        "Tell us what interests you!",
                                        style: AppTextStyles.h4.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.textGray_80),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),

                                      ///CARD DESCRIPTION
                                      Text(
                                        "You don’t have any interests listed. Tell us what you love the most and we’ll recommend relevant products to you.",
                                        style:
                                            AppTextStyles.bodyRegular.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textGray_60,
                                          height: 24 / 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),

                                      ///ADD INTERESTS BUTTON
                                      PrimaryButton(
                                        text: "Add my interests",
                                        onClick: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 44.h,
                                ),

                                ///MY ACCOUNT TITLE AND EDIT OPTION
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "MY ACCOUNT",
                                      style: AppTextStyles.label.copyWith(
                                          color: AppColors.uiGray_80,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      "EDIT",
                                      style: AppTextStyles.linkSmall.copyWith(
                                          color: AppColors.uiGray_60,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),

                                ///PROFILE OPTION CARDS
                                Container(
                                  alignment: Alignment.center,
                                  height: 108.h,
                                  child: ListView(
                                    shrinkWrap: true,
                                    clipBehavior: Clip.none,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ///PAYMENT
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: IconCard(
                                              icon: Icons.credit_card,
                                              title: "Payment"),
                                        ),
                                      ),

                                      ///ADDRESS
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: IconCard(
                                              icon: Icons.location_on_outlined,
                                              title: "Address"),
                                        ),
                                      ),

                                      ///BUY AGAIN
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8.w, 0, 0, 0),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: IconCard(
                                              icon: Icons.shopping_bag_outlined,
                                              title: "Buy Again"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),

                                ///LOGOUT BUTTON
                                PrimaryButton(
                                  text: "Logout",
                                  onClick: () {
                                    authController.logout();
                                  },
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: SecondaryButton(
                                text: "Login to continue",
                                onClick: () {
                                  Get.toNamed(Routes.LOGIN);
                                }),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
