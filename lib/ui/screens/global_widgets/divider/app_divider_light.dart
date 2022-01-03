import 'package:flutter/material.dart';
import 'package:habitual/ui/constants/colors.dart';

class AppDividerLight extends StatelessWidget {
  const AppDividerLight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.uiGray_20,
      height: 1,
    );
  }
}
