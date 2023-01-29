import 'package:get/get.dart';

import '../controllers/barthel_index_controller.dart';

class BarthelIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarthelIndexController>(
      () => BarthelIndexController(),
    );
  }
}
