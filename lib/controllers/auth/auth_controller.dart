import 'package:get/get.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/auth/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final Rx<String?> userIdRx = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    // user = Rx<UserModel?>(authRepository.getCurrentUser());
    userIdRx.bindStream(authRepository.getUserStream());
  }

  Future<String?> loginWithEmailAndPass(String email, String password) async {
    return await authRepository.loginWithEmailAndPass(email, password);
  }

  Future logout() async {
    return await authRepository.logout();
  }

  Future<String?> registerWithEmailAndPass(email, password) {
    return authRepository.registerWithEmailAndPass(email, password);
  }
}
