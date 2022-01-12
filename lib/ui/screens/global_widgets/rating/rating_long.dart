import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class RatingLong extends StatelessWidget {
  const RatingLong({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(
            (i <= value)
                ? Icons.star_rounded
                : (i <= value + 0.5)
                    ? Icons.star_half_rounded
                    : Icons.star_border_rounded,
            color: AppColors.primaryColor,
            size: 16.r,
          ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          value.toStringAsFixed(1),
          style: AppTextStyles.bodySmallBold,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          "12 Reviews",
          style: AppTextStyles.linkSmall.copyWith(
              color: AppColors.textGray_60, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
