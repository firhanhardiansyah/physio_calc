import 'dart:developer';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void mailToDeveloper() async {
    String email = Uri.encodeComponent("firhanhardiansyah.dev@gmail.com");
    Uri mail = Uri.parse("mailto:$email");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      //email app is not opened
    }
  }
}
