import 'package:get/get.dart';

import '../controllers/mmse_controller.dart';

class MmseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MmseController>(
      () => MmseController(),
    );
  }
}
