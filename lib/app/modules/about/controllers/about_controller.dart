import 'dart:developer';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {

  final appName = ''.obs;
  final packageName = ''.obs;
  final version = ''.obs;
  final buildNumber = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    versionInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void versionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    log('$packageInfo');

    appName(packageInfo.appName);
    packageName(packageInfo.packageName);
    version(packageInfo.version);
    buildNumber(packageInfo.buildNumber);

    update();
  }

  void mailTo({required String email}) async {
    email = Uri.encodeComponent(email);

    Uri mail = Uri.parse("mailto:$email");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      //email app is not opened
    }
  }
}
