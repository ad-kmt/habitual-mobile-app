import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:habitual/bindings/intro_binding.dart';
import 'package:habitual/ui/screens/home/home.dart';
import 'package:habitual/ui/screens/intro/intro.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INTRO;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => const Home()),
    GetPage(name: Routes.INTRO, page: () => Intro(), binding: IntroBinding()),
  ];
}
