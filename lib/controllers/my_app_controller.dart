import 'package:get/get.dart';
import 'package:habitual/data/repository/my_app_repository.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyAppController extends GetxController {
  final MyAppRepository myAppRepository;

  MyAppController({required this.myAppRepository});

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  @override
  void onInit() {
    super.onInit();
  }
}
