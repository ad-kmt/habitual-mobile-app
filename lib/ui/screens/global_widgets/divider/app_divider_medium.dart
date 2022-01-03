import 'package:flutter/material.dart';
import 'package:habitual/ui/constants/colors.dart';

class AppDividerMedium extends StatelessWidget {
  const AppDividerMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.uiGray_40,
      height: 1,
    );
  }
}
