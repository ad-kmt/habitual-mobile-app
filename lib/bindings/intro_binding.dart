import 'package:get/get.dart';
import 'package:habitual/controllers/auth/auth_controller.dart';
import 'package:habitual/controllers/intro/intro_controller.dart';
import 'package:habitual/data/provider/firebase_auth_api.dart';
import 'package:habitual/data/repository/auth/auth_repository.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }
}
