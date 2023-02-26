import 'package:get/get.dart';

import '../controllers/bbs_controller.dart';

class BbsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BbsController>(
      () => BbsController(),
    );
  }
}
