import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/forward_icon_button.dart';

class ColoredCardFlexible extends StatelessWidget {
  const ColoredCardFlexible(
      {Key? key,
      required this.title,
      required this.color,
      this.image = "",
      this.button = false})
      : super(key: key);

  final String title;
  final Color color;
  final String image;
  final bool button;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.r),
      width: 156.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Text(
              title,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.bgWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          if (image.isNotEmpty)
            SizedBox(
                height: 137.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(left: 0.w, child: Image.asset(image)),
                  ],
                )),
          SizedBox(
            height: 8.h,
          ),
          if (button)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.buttonShadowDefault,
                    ),
                    child: const ForwardIconButton(),
                  ),
                ],
              ),
            )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
    );
  }
}
