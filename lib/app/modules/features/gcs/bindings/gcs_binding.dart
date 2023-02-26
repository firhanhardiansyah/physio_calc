import 'package:get/get.dart';

import '../controllers/gcs_controller.dart';

class GcsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GcsController>(
      () => GcsController(),
    );
  }
}
