import 'package:flutter/material.dart';
import 'package:habitual/ui/constants/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({Key? key}) : super(key: key);

  // final String labelRight;
  // final String labelLeft;
  // final String placeholder;
  // final String fieldMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Label left",
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "Label right",
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Placeholder",
            hintStyle: AppTextStyles.bodyRegular
                .copyWith(color: AppColors.textGray_60),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
                color: AppColors.uiGray_40,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: AppColors.uiGray_40,
                width: 1.0,
              ),
            ),
            prefixIcon: Icon(Icons.search, color: AppColors.uiGray_60,),
            suffixIcon: Icon(Icons.close, color: AppColors.uiGray_60,),
          ),
        ),
      ],
    );
  }
}
