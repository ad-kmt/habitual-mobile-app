import 'package:get/get.dart';
import 'package:habitual/controllers/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
