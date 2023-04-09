import 'package:get/get.dart';

import '../controllers/womac_controller.dart';

class WomacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WomacController>(
      () => WomacController(),
    );
  }
}
