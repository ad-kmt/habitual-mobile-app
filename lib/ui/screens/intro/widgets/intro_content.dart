import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/dimensions.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key? key,
    this.title,
    this.body,
    this.image,
    this.backgroundCircleColor, this.backgroundCirclePosition,
  }) : super(key: key);
  final String? title, body, image;
  final Color? backgroundCircleColor;
  final bool? backgroundCirclePosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: backgroundCirclePosition==true ? -152.w: 102.w,
            top: -59.h,
            child: Container(
              width: 452.r,
              height: 452.r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(251.r),
                  color: backgroundCircleColor),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(image!),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h3.copyWith(
                            color: AppColors.uiGray_80,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      body!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyRegular,
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
