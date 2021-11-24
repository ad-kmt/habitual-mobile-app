import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/input/base_input.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    child: const Icon(
                      Icons.close,
                      color: AppColors.uiGray_80,
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
            SizedBox(height: 24.h,),
            SvgPicture.asset(Assets.logoPrimary, height: 40.h, ),
            SizedBox(height: 24.h,),
            Form(child: Column(
              children: [
                BaseInput(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
