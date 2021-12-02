import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';

import 'base/icon_button_small.dart';

class WishlistIconButton extends StatelessWidget {
  const WishlistIconButton({Key? key, required this.isSelected})
      : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ButtonIconSmall(
            iconData: Icons.favorite,
            iconSize: 18.r,
            color: AppColors.accentRed,
          )
        : ButtonIconSmall(iconData: Icons.favorite_border, iconSize: 18.r);
  }
}
