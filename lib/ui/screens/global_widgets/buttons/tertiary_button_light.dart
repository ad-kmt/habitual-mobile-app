import 'package:flutter/material.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class TertiaryButtonLight extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;

  const TertiaryButtonLight(
      {Key? key, required this.text, required this.onClick})
      : super(key: key);

  Color getForegroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.textGray_80;
    }
    return AppColors.textGray_60;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(14)),
        foregroundColor: MaterialStateProperty.resolveWith(
            (states) => getForegroundColor(states)),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        animationDuration: const Duration(milliseconds: 100),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
      onPressed: onClick,
      child: Text(
        text,
        style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
