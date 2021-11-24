import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.star_rounded, color: AppColors.primaryColor, size: 12.r,),
      SizedBox(width: 4.w,),
      Text(value.toStringAsFixed(1), style: AppTextStyles.bodySmallBold,),
    ],);
  }
}
