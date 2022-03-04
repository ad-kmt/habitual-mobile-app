import 'package:get/get.dart';
import 'package:habitual/controllers/intro_screen_controller.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroScreenController>(() => IntroScreenController());
  }
}
