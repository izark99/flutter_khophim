import 'package:khophim/controllers/controller.dart';
import 'package:khophim/controllers/data_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
    Get.put(DataController());
  }
}
