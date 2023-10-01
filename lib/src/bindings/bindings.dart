import 'package:farmtopia_task/src/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

import '../controllers/map_controller.dart';
import '../controllers/sign_up_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(MapController());
  }
}
