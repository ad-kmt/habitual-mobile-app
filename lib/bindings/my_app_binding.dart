import 'package:get/get.dart';
import 'package:habitual/controllers/my_app_screen_controller.dart';
import 'package:habitual/data/repository/my_app_repository.dart';

class MyAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppScreenController>(
      () => MyAppScreenController(
        myAppRepository: MyAppRepository(),
      ),
    );
  }
}
