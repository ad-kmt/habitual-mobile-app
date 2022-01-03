import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/app_theme.dart';
import 'package:habitual/ui/constants/strings.dart';

import 'bindings/intro_binding.dart';
import 'controllers/auth/auth_controller.dart';
import 'data/provider/firebase_auth_api.dart';
import 'data/repository/auth/auth_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(
    authRepository: AuthRepository(
      authApiClient: FirebaseAuthApiClient(),
    ),
  ));
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
  }
}
