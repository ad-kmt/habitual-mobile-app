import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base/button_icon_small.dart';

class ForwardIconButton extends StatelessWidget {
  const ForwardIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonIconSmall(iconData: Icons.arrow_forward_ios_rounded, iconSize: 16.r,);
  }
}
