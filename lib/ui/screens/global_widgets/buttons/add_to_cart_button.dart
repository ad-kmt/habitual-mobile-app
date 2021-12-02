import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, this.onClick}) : super(key: key);

  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w)),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.textGray_80),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.h),
            ),
          ),
        ),
        onPressed: onClick,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 16.h),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Add to cart",
              style: AppTextStyles.h6.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
