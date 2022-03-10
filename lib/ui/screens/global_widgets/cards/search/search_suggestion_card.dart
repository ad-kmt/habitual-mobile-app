import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';

class SearchSuggestionCard extends StatelessWidget {
  final String searchText;
  final String boldText;

  const SearchSuggestionCard(
      {Key? key, required this.searchText, required this.boldText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(searchText),
                Text(boldText,
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.uiGray_40,
              size: 16.r,
            ),
          ]),
    );
  }
}
