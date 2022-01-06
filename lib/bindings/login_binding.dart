import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/registration/login_controller.dart';
import 'package:habitual/data/provider/firebase_auth_api.dart';
import 'package:habitual/data/repository/registration/login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () =>
          LoginController(
            loginRepository: LoginRepository(
              authApiClient: FirebaseAuthApiClient(),
            ),
          ),
    );
  }
}
