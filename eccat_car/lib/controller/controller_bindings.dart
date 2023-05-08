
import 'package:eccat_car/Pages/AI/controller/controller.dart';
import 'package:get/get.dart';

class controllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<controller>(controller());
  }
}