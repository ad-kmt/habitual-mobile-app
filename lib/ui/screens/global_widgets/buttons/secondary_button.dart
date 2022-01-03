import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;
  final IconData? iconRight;
  final IconData? iconLeft;

  const SecondaryButton(
      {Key? key,
      required this.text,
      required this.onClick,
      this.iconRight,
      this.iconLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.buttonShadowDefault,
      ),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.all(16.r)),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.uiWhite),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.textGray_80),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconLeft != null)
              Icon(
                iconLeft,
                color: AppColors.textGray_80,
                size: 16.r,
              ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              text,
              style: AppTextStyles.bodyRegular.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.textGray_80),
            ),
            SizedBox(
              width: 8.w,
            ),
            if (iconRight != null)
              Icon(
                iconRight,
                color: AppColors.textGray_80,
                size: 16.r,
              ),
          ],
        ),
      ),
    );
  }
}
