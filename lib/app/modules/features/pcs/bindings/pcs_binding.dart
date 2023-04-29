import 'package:get/get.dart';

import '../controllers/pcs_controller.dart';

class PcsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PcsController>(
      () => PcsController(),
    );
  }
}
