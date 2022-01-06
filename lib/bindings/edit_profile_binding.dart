import 'package:get/get.dart';
import 'package:habitual/controllers/profile/edit_profile_controller.dart';
import 'package:habitual/data/provider/user_api.dart';
import 'package:habitual/data/repository/profile/edit_profile_repository.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(
        editProfileRepository: EditProfileRepository(
          userApiClient: UserApiClient(),
        ),
      ),
    );
  }
}
