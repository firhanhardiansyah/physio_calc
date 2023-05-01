import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupHelper {
  static DateTime? _currentBackPressTime;

  static Future<bool> showExitPopup() async {
    return await Get.dialog(AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Anda yakin tidak akan melanjutkanya?'),
          actions: [
            TextButton(
                onPressed: () => Get.back(), child: const Text('Kembali')),
            ElevatedButton(
                onPressed: () => Get.close(2), child: const Text('Ya')),
          ],
        )) ??
        false;
  }

  static Future<bool> showExitApp() async {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;

      if (Get.isSnackbarOpen == false) {
        Get.showSnackbar(const GetSnackBar(
          messageText: Text(
            'Tekan sekali lagi untuk keluar',
            style: TextStyle(color: Colors.black87),
          ),
          snackStyle: SnackStyle.FLOATING,
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          borderRadius: 8,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.amber,
        ));
      }

      return Future.value(false);
    }

    return Future.value(true);
  }
}
