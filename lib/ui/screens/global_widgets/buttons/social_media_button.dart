import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
      {Key? key, required this.text, this.onClick, this.imageSvg = ""})
      : super(key: key);

  final String text;
  final VoidCallback? onClick;
  final String imageSvg;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.uiWhite),
        foregroundColor:
            MaterialStateProperty.all<Color>(AppColors.textGray_80),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: AppColors.uiGray_80, width: 1),
        ),
      ),
      onPressed: onClick,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                if (imageSvg.isNotEmpty)
                  SvgPicture.asset(
                    imageSvg,
                    width: 16.r,
                    height: 16.r,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: AppTextStyles.bodyRegular
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
