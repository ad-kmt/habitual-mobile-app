import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:habitual/bindings/intro_binding.dart';
import 'package:habitual/bindings/my_app_binding.dart';
import 'package:habitual/bindings/signup_binding.dart';
import 'package:habitual/bindings/splash_binding.dart';
import 'package:habitual/ui/screens/app_main.dart';
import 'package:habitual/ui/screens/intro/intro.dart';
import 'package:habitual/ui/screens/intro/intro_signup.dart';
import 'package:habitual/ui/screens/intro/signup_prompt.dart';
import 'package:habitual/ui/screens/registration/login.dart';
import 'package:habitual/ui/screens/registration/login_profile_page.dart';
import 'package:habitual/ui/screens/registration/signup.dart';
import 'package:habitual/ui/screens/splash/splash.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INTRO;

  static final routes = [
    // GetPage(name: Routes.HOME, page: () => Home()),
    GetPage(name: Routes.INTRO, page: () => Intro(), binding: IntroBinding()),
    GetPage(name: Routes.INTRO_SIGN_UP, page: () => const IntroSignUp()),
    GetPage(name: Routes.SIGNUP_PROMPT, page: () => const SignupPrompt()),
    GetPage(
      name: Routes.SPLASH,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(name: Routes.LOGIN, page: () => const Login()),
    GetPage(
        name: Routes.SIGNUP, page: () => Signup(), binding: SignupBinding()),
    GetPage(name: Routes.LOGIN_PROFILE, page: () => LoginProfilePage()),
    // GetPage(name: Routes.WISHLIST, page: () => const Wishlist()),
    // GetPage(name: Routes.PROFILE, page: () => const Profile()),
    GetPage(
      name: Routes.MY_APP,
      page: () => AppMain(),
      binding: MyAppBinding(),
    ),
  ];
}
