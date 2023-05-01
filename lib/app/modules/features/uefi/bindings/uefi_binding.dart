import 'package:get/get.dart';

import '../controllers/uefi_controller.dart';

class UefiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UefiController>(
      () => UefiController(),
    );
  }
}
