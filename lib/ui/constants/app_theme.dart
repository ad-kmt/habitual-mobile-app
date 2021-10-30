import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';

import 'font_family.dart';

/// Colour Creation:
/// In order to create the custom colours you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colours. The six character hex code is what follows. If you wanted the colour
/// #114488 or #D39090 as primary colours in your theme, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.

/// TEXT STYLE BEST PRACTICE
/// try to limit its use to the definition of
/// colors, decoration, weight
///
/// try to avoid hardcoding:
/// fontSize, fontFamily, letterSpacing
///
/// instead use: Theme.of(context).textTheme.heading6.copyWith(color: orange) etc.

TextTheme textTheme = TextTheme(
  headline1:
      TextStyle(fontSize: 40.sp, height: 40.sp, fontWeight: FontWeight.w600),
  headline2:
      TextStyle(fontSize: 32.sp, height: 36.sp, fontWeight: FontWeight.w600),
  headline3:
      TextStyle(fontSize: 28.sp, height: 32.sp, fontWeight: FontWeight.w600),
  headline4:
      TextStyle(fontSize: 20.sp, height: 24.sp, fontWeight: FontWeight.w600),
  headline5:
      TextStyle(fontSize: 16.sp, height: 24.sp, fontWeight: FontWeight.w600),
  headline6:
      TextStyle(fontSize: 12.sp, height: 12.sp, fontWeight: FontWeight.w600),
);

final ThemeData themeData = ThemeData(
  ///TEXT
  textTheme: textTheme,
  fontFamily: FontFamily.lato,

  ///BRIGHTNESS
  brightness: Brightness.light,

  ///COLORS
  primaryColor: AppColors.primaryColor,
  primaryColorBrightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.bgWhite,

  ///APP THEME
  // appBarTheme: const AppBarTheme(
  //   foregroundColor: Colors.white,
  //   backgroundColor: Colors.black,
  // ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.lato,
  brightness: Brightness.dark,
);
