import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/app_theme.dart';
import 'package:habitual/ui/constants/strings.dart';

import 'bindings/intro_binding.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: themeData,
        locale: const Locale('en', 'IN'),
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        initialBinding: IntroBinding(),
        // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
        defaultTransition: Transition.fade,
        // locale: Locale(_languageStore.locale),
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      locale: const Locale('en', 'IN'),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      initialBinding: IntroBinding(),
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      defaultTransition: Transition.fade,
      // locale: Locale(_languageStore.locale),
    );
  }
}
