import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:habitual/bindings/intro_binding.dart';
import 'package:habitual/bindings/splash_binding.dart';
import 'package:habitual/ui/screens/home/home.dart';
import 'package:habitual/ui/screens/intro/intro.dart';
import 'package:habitual/ui/screens/intro/intro_signup.dart';
import 'package:habitual/ui/screens/intro/signup_prompt.dart';
import 'package:habitual/ui/screens/login/login.dart';
import 'package:habitual/ui/screens/splash/splash.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => Home()),
    GetPage(name: Routes.INTRO, page: () => Intro(), binding: IntroBinding()),
    GetPage(name: Routes.INTRO_SIGN_UP, page: () => const IntroSignUp()),
    GetPage(name: Routes.SIGNUP_PROMPT, page: () => const SignupPrompt()),
    GetPage(
        name: Routes.SPLASH, page: () => const Splash(), binding: SplashBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => const Login()),

  ];
}
