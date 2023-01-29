import 'package:get/get.dart';

import '../controllers/ugo_fisch_scale_controller.dart';

class UgoFischScaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UgoFischScaleController>(
      () => UgoFischScaleController(),
    );
  }
}
