import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';

class CircularButtonIconSmallWhite extends StatelessWidget {
  const CircularButtonIconSmallWhite(
      {Key? key, required this.iconData, required this.iconSize, this.color})
      : super(key: key);

  final IconData iconData;
  final double iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.buttonShadowSmall,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CircleAvatar(
        radius: 16.r,
        backgroundColor: AppColors.bgWhite,
        child: IconButton(
          color: AppColors.uiGray_80,
          padding: const EdgeInsets.all(0),
          iconSize: iconSize.r,
          icon: Icon(
            iconData,
            color: color,
          ),
          onPressed: () {
            // do something
          },
        ),
      ),
    );
  }
}
