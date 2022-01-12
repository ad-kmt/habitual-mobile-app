import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class RatingSmall extends StatelessWidget {
  const RatingSmall({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: AppColors.primaryColor,
          size: 16.r,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          value.toStringAsFixed(1),
          style: AppTextStyles.bodySmallBold,
        ),
      ],
    );
  }
}
