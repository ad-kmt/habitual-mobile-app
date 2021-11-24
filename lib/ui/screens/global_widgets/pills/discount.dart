import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class DiscountPill extends StatelessWidget {
  const DiscountPill({Key? key, required this.discountPercentage})
      : super(key: key);

  final double discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      child: Center(
        child: Text(
          '${discountPercentage.round()}% OFF',
          style: AppTextStyles.pillSmall.copyWith(
            color: AppColors.green,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.green_20,
      ),
    );
  }
}
