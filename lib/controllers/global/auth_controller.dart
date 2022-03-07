import 'package:get/get.dart';
import 'package:habitual/data/repository/auth_repository.dart';

/*
  AuthController: Takes care of User Auth State.
 */

class AuthController extends GetxController {
  final AuthRepository authRepository;

  final Rx<String?> userIdRx = Rx<String?>(null);

  AuthController({required this.authRepository});

  @override
  void onInit() {
    super.onInit();
    userIdRx.bindStream(authRepository.getUserIdStream());
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
