import 'package:get/get.dart';

import '../controllers/odi_controller.dart';

class OdiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OdiController>(
      () => OdiController(),
    );
  }
}
