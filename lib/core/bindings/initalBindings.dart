
import 'package:get/get.dart';

import '../class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Crud()) ;//injection
  }
}
// to replace Crud crud = Crud(); with Crud crud = Get.find()
