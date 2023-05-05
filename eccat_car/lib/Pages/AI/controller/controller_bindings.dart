import 'package:get/get.dart';

import 'controller.dart';

class controllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<controller>(controller());
  }
}