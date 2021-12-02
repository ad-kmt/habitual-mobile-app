import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/app_divider_medium.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/nav/bottom_nav_bar.dart';

class LoginProfilePage extends StatelessWidget {
  const LoginProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.h,
                  ),

                  ///PROFILE PAGE TITLE
                  Text(
                    "Profile",
                    style:
                        AppTextStyles.h4.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  ///DESCRIPTION
                  Text(
                    "Log in to start and explore your personalized shopping experience.",
                    style: AppTextStyles.h4.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  ///LOGIN BUTTON
                  Row(
                    children: [
                      Expanded(
                          child: PrimaryButton(text: "Log in", onClick: () {})),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  ///SIGNUP LINK
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
                      Text(
                        "Sign up",
                        style: AppTextStyles.linkRegular
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),

                  ///PROFILE LIST ITEMS
                  const AppDividerMedium(),
                  const ProfileListItem(
                      text: "Settings", icon: Icons.settings_outlined),
                  const ProfileListItem(
                      text: "Need Help?", icon: Icons.help_outline_rounded),
                  SizedBox(
                    height: 36.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w800),
              ),
              Icon(
                icon,
                size: 24.r,
                color: AppColors.uiGray_80,
              )
            ],
          ),
        ),
        const AppDividerMedium(),
      ],
    );
  }
}
