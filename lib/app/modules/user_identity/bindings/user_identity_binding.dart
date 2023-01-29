import 'package:get/get.dart';

import '../controllers/user_identity_controller.dart';

class UserIdentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserIdentityController>(
      () => UserIdentityController(),
    );
  }
}
