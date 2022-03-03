import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/sign_up_controller.dart';
import 'package:habitual/data/provider/user_api.dart';
import 'package:habitual/data/repository/signup_repository.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(
        signUpRepository: SignUpRepository(
          userApiClient: UserApiClient(),
        ),
      ),
    );
  }
}
