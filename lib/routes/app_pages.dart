import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:habitual/bindings/edit_profile_binding.dart';
import 'package:habitual/bindings/intro_binding.dart';
import 'package:habitual/bindings/login_binding.dart';
import 'package:habitual/bindings/my_app_binding.dart';
import 'package:habitual/bindings/signup_binding.dart';
import 'package:habitual/ui/screens/app_main.dart';
import 'package:habitual/ui/screens/intro/intro.dart';
import 'package:habitual/ui/screens/intro/intro_signup.dart';
import 'package:habitual/ui/screens/intro/signup_prompt.dart';
import 'package:habitual/ui/screens/product/product.dart';
import 'package:habitual/ui/screens/profile/edit_profile.dart';
import 'package:habitual/ui/screens/registration/login.dart';
import 'package:habitual/ui/screens/registration/login_profile_page.dart';
import 'package:habitual/ui/screens/registration/signup.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INTRO;

  static final routes = [
    // GetPage(name: Routes.HOME, page: () => Home()),
    GetPage(
      name: Routes.INTRO,
      page: () => Intro(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.INTRO_SIGN_UP,
      page: () => const IntroSignUp(),
    ),
    GetPage(
      name: Routes.SIGNUP_PROMPT,
      page: () => const SignupPrompt(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => Signup(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_PROFILE,
      page: () => LoginProfilePage(),
    ),
    // GetPage(name: Routes.WISHLIST, page: () => const Wishlist()),
    // GetPage(name: Routes.PROFILE, page: () => const Profile()),
    GetPage(
      name: Routes.MY_APP,
      page: () => AppMain(),
      binding: MyAppBinding(),
    ),

    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfile(),
      binding: EditProfileBinding(),
    ),

    GetPage(
      name: Routes.PRODUCT,
      page: () => Product(),
    )
  ];
}
