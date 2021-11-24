import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/base/button_icon_small.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/forward_icon_button.dart';

class ColoredCardFixed extends StatelessWidget {
  final String title;
  final Color color;

  const ColoredCardFixed({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: 156.r,
      height: 156.r,
      child: Stack(
        children: [
          Text(
            title,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.bgWhite,
              fontWeight: FontWeight.w700,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: AppShadows.buttonShadowDefault,
              ),
              child: const ForwardIconButton(),
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
