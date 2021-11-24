import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class StaffPickPill extends StatelessWidget {
  const StaffPickPill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      child: Center(
        child: Text(
          'STAFF PICK',
          style: AppTextStyles.pillSmall.copyWith(
            color: AppColors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.blue_20,
      ),
    );
  }
}
