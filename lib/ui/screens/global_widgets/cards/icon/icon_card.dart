import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class IconCard extends StatelessWidget {
  const IconCard({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      width: 113.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: AppShadows.cardShadowMedium,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.uiGray_60,
            size: 32.h,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            title,
            style: AppTextStyles.h6.copyWith(
                fontWeight: FontWeight.w800, color: AppColors.textGray_80),
          )
        ],
      ),
    );
  }
}
