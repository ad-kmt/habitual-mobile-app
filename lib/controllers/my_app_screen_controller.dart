import 'package:get/get.dart';
import 'package:habitual/data/repository/my_app_repository.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyAppScreenController extends GetxController {
  final MyAppRepository myAppRepository;

  MyAppScreenController({required this.myAppRepository});

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  @override
  void onInit() {
    super.onInit();
  }
}
