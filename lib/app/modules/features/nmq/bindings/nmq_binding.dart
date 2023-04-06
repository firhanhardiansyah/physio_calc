import 'package:get/get.dart';

import '../controllers/nmq_controller.dart';

class NmqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NmqController>(
      () => NmqController(),
    );
  }
}
