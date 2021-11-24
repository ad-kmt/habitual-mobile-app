import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base/button_icon_small.dart';

class WishlistIconButton extends StatelessWidget {
  const WishlistIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonIconSmall(
        iconData: Icons.favorite_border, iconSize: 18.r);
  }
}
