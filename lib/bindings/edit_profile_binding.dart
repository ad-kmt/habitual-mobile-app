import 'package:get/get.dart';
import 'package:habitual/controllers/edit_profile_screen_controller.dart';
import 'package:habitual/data/provider/user_api.dart';
import 'package:habitual/data/repository/edit_profile_repository.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileScreenController>(
      () => EditProfileScreenController(
        editProfileRepository: EditProfileRepository(
          userApiClient: UserApiClient(),
        ),
      ),
    );
  }
}
